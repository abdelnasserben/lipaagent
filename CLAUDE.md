# CLAUDE.md

This repository is the **agent mobile app of Lipa** (company **Imara**): the Android app (Flutter)
used by Imara's cash agents to do cash-in, merchant cash-out, customer enrolment + KYC, card sales
and replacements, and to follow their float, history and commissions.

It is a pure client of the Lipa backend, a separate repository:
`C:\Users\ahama\OneDrive\Documenten\javaprojects\LipaBackend` (written `<backend>` below).
**The backend is the source of truth**; this app holds no business rule the server does not enforce.
The old `../Agent_Frontend_Specification.md` (May 2026, "KomoPay") is obsolete: never use it.

The owner does not write the code: they rely on AI. Keep the project **boring and predictable**:
follow the existing patterns (below), no new package without asking, no clever abstraction.

## Before any change

Read in the backend repository:

- `<backend>/docs/api/README.md` — shared API contract: envelopes, errors, pagination,
  idempotency, `202` outcomes, sign-in, notifications.
- `<backend>/docs/api/agent.md` — what the agent app must know beyond the schema.
- The OpenAPI contract of group `agent`: `http://localhost:8080/v3/api-docs/agent` (backend running).
  Field names, enum values and paths come from there, never from memory or old specs.
- `<backend>/CONVENTIONS.md` §3 — glossary. Use the same terms in code (account, float, cash-in…).

The backend documentation is never edited from this repository. If the API seems wrong or a guide
disagrees with the contract, say so and ask; do not work around it in the app. Record every backend
problem found in `docs/backend-issues.md` (and the app's temporary workaround, if any).

## Stack

Flutter (Dart 3.12), Riverpod (state + dependency injection), Dio (HTTP), flutter_secure_storage
(tokens), nfc_manager (card UID), image_picker (KYC documents), pdf / printing / share_plus (receipts).
Android is the target; iOS is scaffolded only.

## Commands

| Command | Does |
|---|---|
| `flutter pub get` | Install dependencies |
| `flutter run --dart-define=ENV=local` | Run against the backend on the dev machine (`localhost:8080`; USB phone: `adb reverse tcp:8080 tcp:8080`; emulator: `--dart-define=API_BASE_URL=http://10.0.2.2:8080`) |
| `dart format lib test` | Format |
| `flutter analyze` / `flutter test` | Checks |
| `flutter build apk --debug --dart-define=ENV=local` | Debug APK |

**At the end of every change: `dart format lib test`, `flutter analyze` and `flutter test` pass.**

## Layout

```
lib/
  core/config/       AppConfig (local | prod base URL)
  core/network/      ApiClient (Dio: bearer, refresh, X-Correlation-Id, errors), envelopes
  core/error/        ApiError + frenchMessageForError (every user-facing error text)
  core/auth/         TokenStore (secure storage)
  core/scan/         NFC card reading, manual UID fallback
  core/theme/        Lipa design tokens (colours, radius, fonts) — the only place colours are defined
  core/widgets/      shared widgets (PinSheet, result screen, pills, amount input…)
  core/utils/        formatters (KMF, phone, dates), receipt PDF
  data/models/       one Dart class per API response (fromJson), enums.dart for every API enum
  data/repositories/ AuthRepository, AgentRepository: the only code that calls the API
  features/<area>/   screens + controllers per area (auth, home, cashin, cashout, enroll, cards…)
test/                unit tests (models, errors, keys)
```

## One way to do each thing

- **Call the API**: add a method to `AuthRepository` / `AgentRepository` using `ApiClient`
  (`get`, `post`, `put`, `delete`, `postMultipart`); parse with `unwrapData`, `PagedResponse.fromBody`
  or `parseDataList`. Screens never use Dio directly.
- **Models**: field names exactly as in the OpenAPI contract; enums with an `unknown` fallback so
  a new backend value never crashes the app.
- **Errors**: catch `ApiError`, show `frenchMessageForError(e)`. **Branch on `e.code`, never on the
  message** (backend messages are technical English and are never shown). Add the French text of any
  new code you handle to `frenchMessageForError`.
- **Text**: French, in the widgets (no translation files yet; other languages to be confirmed).
- **Money**: integers in minor units (`KMF` has no decimals), shown with `fmtKmf`.
- **Money-moving requests** (cash-in, cash-out, card sale, card replacement): one `OperationKey` per
  screen/controller, `forIntent('<who>|<amount>|…')` gives the `Idempotency-Key`: the same key for a
  retry of the same operation (network error, PIN or confirmation step), a new one when what is sent
  changes. `202` is "not done yet", never "done"; `PENDING_APPROVAL` means do not hand over the cash.
- **Capabilities**: hide what `GET /agent/me` says is off (`canDoCashIn`, `canDoCashOut`,
  `canSellCards`); the server refuses it anyway.

## API rules the app must follow

- `401` with a session code (`UNAUTHORIZED`, `INVALID_TOKEN`, `TOKEN_EXPIRED`, `TOKEN_REVOKED`):
  refresh once, else back to login. Any other `401` (wrong PIN: `AUTH_PIN_INVALID`,
  `INVALID_CREDENTIALS`) is an answer: never resend it (each resend counts a wrong PIN).
- `403` → the action should not have been shown. `409` → retry with the same key or refresh.
  `422` → show the reason. `429 RATE_LIMITED` → ask to wait.
- Tokens in secure storage only; the PIN is never stored or logged; the merchant types their own PIN.

## Working agreement

- Code, identifiers, comments and commit messages in English; UI text in French.
- One piece of work = one branch (`feature/…`, `fix/…`), small commits. Never push without asking.
- Unknowns (hostnames, missing endpoint, unclear rule): ask, do not improvise.
