# Lipa — Application mobile agent

Application Flutter du **portail agent Lipa** : dépôts/retraits d'espèces (cash-in /
cash-out), enrôlement de clients + KYC, vente et remplacement de cartes NFC,
commissions et relevés. L'UI reprend le design system du client Lipa (mêmes polices,
mêmes tokens) et consomme l'API du backend Lipa (`../../../javaprojects/LipaBackend`).

**Le backend fait foi** : le contrat OpenAPI du groupe `agent`
(`http://localhost:8080/v3/api-docs/agent`) et les guides `docs/api/README.md` et
`docs/api/agent.md` du backend. L'ancien `Agent_Frontend_Specification.md` (mai 2026)
est périmé : ne plus s'y référer. Voir aussi `CLAUDE.md`.

> Toute la copie visible est en français, sous la marque **Lipa**. La devise est le
> **KMF** (entier, unité mineure).

## Stack

- **Flutter / Dart 3.12**, **Riverpod 3** — état (un contrôleur `Notifier` par parcours)
- **Client API généré** depuis le contrat OpenAPI du backend (`swagger_parser`,
  Retrofit + Dio, `json_serializable`) : `dart run tool/api_generate.dart`
- **flutter gen-l10n** — tous les textes dans `lib/l10n/app_fr.arb`
- **flutter_secure_storage** — tokens dans le Keystore Android
- Polices du design system Lipa embarquées (`assets/fonts`) : Bricolage Grotesque + DM Mono,
  Open Sans pour les reçus PDF — rien n'est téléchargé à l'exécution
- **nfc_manager** — lecture réelle de la puce NFC ; repli en saisie manuelle de l'UID
- **image_picker** — capture/sélection des pièces KYC (caméra + galerie)
- **pdf** / **printing** / **share_plus** — reçus & relevés
- **qr_flutter** — QR code d'activation du TOTP

## Organisation

```
lib/
  api/generated/   client généré depuis le contrat — ne jamais modifier
  api/             api_client (send + requireData), helpers, libellés, OperationKey
  core/            erreurs, tokens, thème, widgets partagés, formatage, scan NFC
  l10n/            app_fr.arb (textes) + l10n.dart (accès `l10n.cle`)
  features/        écrans + contrôleurs, par domaine
    auth/          connexion téléphone + PIN, MFA, PIN oublié, session
    agent/         shell à onglets + données serveur lues par les écrans
    home/          accueil : float, résumé du jour, raccourcis
    operations/    hub « Opérer »
    cashin/ cashout/   dépôt / retrait marchand
    enroll/        enrôlement client + pièces KYC
    cards/         vente, recherche, remplacement, perte/vol
    commissions/ activity/ notifications/ profile/ security/
  app.dart         racine : bascule connexion ↔ shell agent
  main.dart        point d'entrée
```

Les écrans n'appellent jamais l'API : ils lisent des providers Riverpod et des contrôleurs
qui passent par le client généré (`ref.read(apiClientProvider).send(...)`).
Le `app.dart` n'a pas d'arbre d'URL (pas de GoRouter) : c'est un shell mono-acteur avec
navigation par onglet ; le seul branchement de haut niveau est auth vs. authentifié.

## Environnements (local / prod)

L'environnement est choisi au build via `--dart-define=ENV=...` (défaut : `local`) :

| ENV     | baseUrl par défaut       | Réseau ? |
|---------|--------------------------|----------|
| `local` | `http://localhost:8080`  | Oui — backend sur la machine de dev (téléphone USB : `adb reverse tcp:8080 tcp:8080` ; émulateur sans `adb reverse` : `API_BASE_URL=http://10.0.2.2:8080`) |
| `prod`  | `https://api.lipa.km`    | Oui — API de production |

On peut surcharger l'URL : `--dart-define=API_BASE_URL=https://...`.

```bash
# Contre un backend local
flutter run --dart-define=ENV=local

# Build de production
flutter build apk --release --dart-define=ENV=prod
```

## Périmètre

L'app couvre tous les endpoints du groupe `agent` (auth, portail agent, notifications) :

- **Auth agent** : login phone+PIN, MFA TOTP, cycle de vie du PIN
  (configuration via token `PIN_SETUP`, changement, reset self-service gated TOTP) ;
  access token TTL 8h → refresh proactif (~5 min avant expiration).
- **Profil / solde / plafonds / résumé du jour** — `/limits` en `404` traité comme
  « non configurés » (pas une erreur).
- **Cash-in** : dépôt sur le compte du client (lookup par téléphone).
- **Cash-out marchand** avec les seuils de contrôle : resoumission avec le **même
  `Idempotency-Key`** plus `merchantPin` / `confirmationAcknowledged` ; `PENDING_APPROVAL`
  = ne pas remettre l'argent, le back-office doit approuver.
- **Enrôlement client + KYC** : formulaire + upload multipart des pièces (caméra/galerie).
- **Cartes** : recherche (NFC ou UID manuel), vente, remplacement, signalement
  perte/vol ; suivi du stock de cartes.
- **Commissions** : liste paginée.
- **Activité** : transactions paginées + détail, relevé ; sens de la transaction
  donné par `balanceChange` (négatif = l'argent est sorti du float).
- **Notifications** : inbox partagée (`code` + `parameters`, le texte est dans l'app),
  badge `/unread`, marquage lu. Les agents n'en reçoivent pas encore.

Conventions transverses : un `Idempotency-Key` (UUID) par opération, gardé pour chaque
nouvel essai de la même opération, renouvelé dès que la personne, le montant ou la
carte change (`OperationKey`) ; un `X-Correlation-Id` par requête ; enveloppes
`ApiResponse` / `PagedResponse` parsées défensivement.

## Plateformes

Android + iOS sont scaffoldés. Android est la cible de dev/test. L'icône de lancement
réutilise le logo du client Lipa (`assets/icon/lipa_icon.png`) :

```bash
dart run flutter_launcher_icons   # régénère les icônes Android/iOS
```

## Vérification rapide

```bash
flutter analyze
flutter test
flutter build apk --debug --dart-define=ENV=local
```
