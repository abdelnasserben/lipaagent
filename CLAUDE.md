# CLAUDE.md

This repository is the **agent mobile app of Lipa** (company **Imara**): the Android app (Flutter)
used by Imara's cash agents to do cash-in, merchant cash-out, customer enrolment + KYC, card sales
and replacements, and to follow their float, history and commissions.

It is a pure client of the Lipa backend, a separate repository:
`C:\Users\ahama\OneDrive\Documenten\javaprojects\LipaBackend` (written `<backend>` below).
**The backend is the source of truth**; this app holds no business rule the server does not enforce.
The old `androidproject/Lipa/Agent_Frontend_Specification.md` (May 2026, "KomoPay") is obsolete: never use it.
It follows the same rules as the back-office web app (`../LipaBackoffice`).

The owner does not write the code: they rely on AI. Keep the project **boring and predictable**:
one way to do each thing (below), no new package without asking, no clever abstraction.

## Before any change

Read in the backend repository:

- `<backend>/docs/api/README.md` — shared API contract: envelopes, errors, pagination,
  idempotency, `202` outcomes, sign-in, notifications.
- `<backend>/docs/api/agent.md` — what the agent app must know beyond the schema.
- `<backend>/CONVENTIONS.md` §3 — glossary. Use the same terms in code (account, float, cash-in…).

The backend documentation is never edited from this repository. If the API seems wrong or a guide
disagrees with the contract, say so and ask; do not work around it in the app. Record every backend
problem found in `docs/backend-issues.md` (and the app's temporary workaround, if any).

## Stack

Flutter (Dart 3.12), Riverpod 3 (state), Dio + Retrofit client **generated from the OpenAPI
contract** (swagger_parser, json_serializable), `flutter gen-l10n` (texts), flutter_secure_storage
(tokens), nfc_manager (card UID), image_picker (KYC documents), pdf / printing / share_plus
(receipts), qr_flutter (TOTP QR code). Fonts are shipped in `assets/fonts`. Android is the target;
iOS is scaffolded only.

## Commands

| Command | Does |
|---|---|
| `flutter pub get` | Install dependencies |
| `dart run tool/api_generate.dart` | Regenerate `lib/api/generated` from the running backend (`/v3/api-docs/agent`) |
| `flutter gen-l10n` | Regenerate `lib/l10n/generated` from `lib/l10n/app_fr.arb` (also done by run/build) |
| `flutter run --dart-define=ENV=local` | Run against the backend on the dev machine (`localhost:8080`; USB phone: `adb reverse tcp:8080 tcp:8080`; emulator: `--dart-define=API_BASE_URL=http://10.0.2.2:8080`) |
| `dart format lib test` / `flutter analyze` / `flutter test` | Checks |
| `flutter build apk --debug --dart-define=ENV=local` | Debug APK |

**At the end of every change: `dart format lib test`, `flutter analyze` and `flutter test` pass.**
After a backend change, run `dart run tool/api_generate.dart` first: compile errors then show what
to adapt.

## Layout

```
lib/
  api/generated/     generated from the contract — never edit
  api/api_client.dart  `send()` + `requireData()`: session, refresh, correlation id, ApiError
  api/model_helpers.dart  small derived values on generated types (direction, outcome…)
  api/enums.dart     labels of API values (`TransactionType.parse(wire).label`)
  api/operation_key.dart  Idempotency-Key of a money-moving operation
  core/error/        ApiError, apiErrorMessage / errorMessage (texts of error codes)
  core/auth/         TokenStore (secure storage)
  core/theme/        Lipa design tokens — the only place colours and fonts are defined
  core/widgets/      shared widgets (PinSheet, result screen, pills, amount input…)
  core/utils/        formatters (KMF, phone, dates), receipt PDF, validators
  l10n/app_fr.arb    every user-visible text; l10n/l10n.dart gives `l10n`
  features/<area>/   screens + one controller per flow (auth, home, cashin, cashout, enroll, cards…)
  features/agent/agent_providers.dart  server data read by the screens (FutureProvider)
test/                unit tests; test/support/fake_backend.dart plays the backend
openapi/agent.json   the contract the client was generated from
```

## One way to do each thing

- **Call the API**: in a controller or provider only, never in a widget:
  `final res = await ref.read(apiClientProvider).send((api) => api.agentMeController.getProfile());`
  then `requireData(res.data)`. Never build a request or a model by hand.
- **Read server data**: a `FutureProvider.autoDispose` in `agent_providers.dart` (or next to the
  feature), watched by the screen with `.when(loading, error, data)`.
- **Run an action**: a `Notifier` controller (`NotifierProvider.autoDispose`) per flow; the screen
  watches it; after an `await`, check `if (!ref.mounted) return;`.
- **Show an error**: `errorMessage(error)` (or `apiErrorMessage(apiError)`). **Branch on `code`,
  never on the message** (technical English, never shown). Add the text of a new code to
  `apiErrorMessage` and `app_fr.arb`.
- **Text**: always `l10n.someKey`, keys in `lib/l10n/app_fr.arb` (French; other languages to be
  confirmed). No literal user text in Dart. API values are shown through `enums.dart` labels.
  Values sent to the backend (island names, wire values) are not texts.
- **Fields**: every response field is optional in the contract: handle `null` (`?? 0`, `?? ''`).
- **Money**: integers in minor units (`KMF` has no decimals), shown with `fmtKmf`.
- **Money-moving requests** (cash-in, cash-out, card sale, card replacement): one `OperationKey` per
  controller, `forIntent('<who>|<amount>|…')` gives the `Idempotency-Key`: the same key for a
  retry of the same operation (network error, PIN or confirmation step), a new one when what is sent
  changes. `202` is "not done yet", never "done"; `PENDING_APPROVAL` means do not hand over the cash.
- **Capabilities**: hide what `GET /agent/me` says is off (`canDoCashIn`, `canDoCashOut`,
  `canSellCards`); the server refuses it anyway.
- **Tests**: controllers and the API client are tested against `FakeBackend` (scripted answers,
  recorded requests). Every money flow keeps a test.

## API rules the app must follow

- `401` with a session code (`UNAUTHORIZED`, `INVALID_TOKEN`, `TOKEN_EXPIRED`, `TOKEN_REVOKED`):
  refresh once, else back to login. Any other `401` (wrong PIN: `AUTH_PIN_INVALID`,
  `INVALID_CREDENTIALS`) is an answer: never resend it (each resend counts a wrong PIN).
- `403` → the action should not have been shown. `409` → retry with the same key or refresh.
  `422` → show the reason. `429 RATE_LIMITED` → ask to wait. No automatic retry of requests.
- Tokens in secure storage only; the PIN is never stored or logged; the merchant types their own PIN.
  Screenshots are blocked (`FLAG_SECURE` in `MainActivity`).

## Working agreement

- Code, identifiers, comments and commit messages in English; UI text in French (`app_fr.arb`).
- One piece of work = one branch (`feature/…`, `fix/…`), small commits. Never push without asking.
- Unknowns (hostnames, missing endpoint, unclear rule): ask, do not improvise.
