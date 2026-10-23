import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('fr')];

  /// No description provided for @labelVerification.
  ///
  /// In fr, this message translates to:
  /// **'En vérification'**
  String get labelVerification;

  /// No description provided for @labelActif.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get labelActif;

  /// No description provided for @labelSuspendu.
  ///
  /// In fr, this message translates to:
  /// **'Suspendu'**
  String get labelSuspendu;

  /// No description provided for @labelGele.
  ///
  /// In fr, this message translates to:
  /// **'Gelé'**
  String get labelGele;

  /// No description provided for @labelCloture.
  ///
  /// In fr, this message translates to:
  /// **'Clôturé'**
  String get labelCloture;

  /// No description provided for @labelAucun.
  ///
  /// In fr, this message translates to:
  /// **'Aucun'**
  String get labelAucun;

  /// No description provided for @labelBasique.
  ///
  /// In fr, this message translates to:
  /// **'Basique'**
  String get labelBasique;

  /// No description provided for @labelVerifie.
  ///
  /// In fr, this message translates to:
  /// **'Vérifié'**
  String get labelVerifie;

  /// No description provided for @labelRenforce.
  ///
  /// In fr, this message translates to:
  /// **'Renforcé'**
  String get labelRenforce;

  /// No description provided for @labelPaiementMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Paiement marchand'**
  String get labelPaiementMarchand;

  /// No description provided for @labelApprovisionnementFloat.
  ///
  /// In fr, this message translates to:
  /// **'Approvisionnement du float'**
  String get labelApprovisionnementFloat;

  /// No description provided for @labelRetraitFloat.
  ///
  /// In fr, this message translates to:
  /// **'Retrait du float'**
  String get labelRetraitFloat;

  /// No description provided for @labelAnnulation.
  ///
  /// In fr, this message translates to:
  /// **'Annulation'**
  String get labelAnnulation;

  /// No description provided for @labelTransfertMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Virement entre marchands'**
  String get labelTransfertMarchand;

  /// No description provided for @labelPaiementFacture.
  ///
  /// In fr, this message translates to:
  /// **'Paiement de facture'**
  String get labelPaiementFacture;

  /// No description provided for @labelReglementFacturier.
  ///
  /// In fr, this message translates to:
  /// **'Règlement des facturiers'**
  String get labelReglementFacturier;

  /// No description provided for @labelRetraitPlateforme.
  ///
  /// In fr, this message translates to:
  /// **'Retrait des revenus'**
  String get labelRetraitPlateforme;

  /// No description provided for @labelVersementCommission.
  ///
  /// In fr, this message translates to:
  /// **'Versement de commission'**
  String get labelVersementCommission;

  /// No description provided for @labelTransaction.
  ///
  /// In fr, this message translates to:
  /// **'Transaction'**
  String get labelTransaction;

  /// No description provided for @labelStandard.
  ///
  /// In fr, this message translates to:
  /// **'Standard'**
  String get labelStandard;

  /// No description provided for @labelPremium.
  ///
  /// In fr, this message translates to:
  /// **'Premium'**
  String get labelPremium;

  /// No description provided for @labelEntreprise.
  ///
  /// In fr, this message translates to:
  /// **'Entreprise'**
  String get labelEntreprise;

  /// No description provided for @labelEmise.
  ///
  /// In fr, this message translates to:
  /// **'Émise'**
  String get labelEmise;

  /// No description provided for @labelActive.
  ///
  /// In fr, this message translates to:
  /// **'Active'**
  String get labelActive;

  /// No description provided for @labelBloquee.
  ///
  /// In fr, this message translates to:
  /// **'Bloquée'**
  String get labelBloquee;

  /// No description provided for @labelExpiree.
  ///
  /// In fr, this message translates to:
  /// **'Expirée'**
  String get labelExpiree;

  /// No description provided for @labelCloturee.
  ///
  /// In fr, this message translates to:
  /// **'Clôturée'**
  String get labelCloturee;

  /// No description provided for @labelEntrepot.
  ///
  /// In fr, this message translates to:
  /// **'En entrepôt'**
  String get labelEntrepot;

  /// No description provided for @labelAttribuee.
  ///
  /// In fr, this message translates to:
  /// **'Attribuée'**
  String get labelAttribuee;

  /// No description provided for @labelVendue.
  ///
  /// In fr, this message translates to:
  /// **'Vendue'**
  String get labelVendue;

  /// No description provided for @labelRetournee.
  ///
  /// In fr, this message translates to:
  /// **'Retournée'**
  String get labelRetournee;

  /// No description provided for @labelAbimee.
  ///
  /// In fr, this message translates to:
  /// **'Abîmée'**
  String get labelAbimee;

  /// No description provided for @labelCarteNationaleIdentite.
  ///
  /// In fr, this message translates to:
  /// **'Carte nationale d’identité'**
  String get labelCarteNationaleIdentite;

  /// No description provided for @labelJustificatifDomicile.
  ///
  /// In fr, this message translates to:
  /// **'Justificatif de domicile'**
  String get labelJustificatifDomicile;

  /// No description provided for @labelLicenceCommerciale.
  ///
  /// In fr, this message translates to:
  /// **'Licence commerciale'**
  String get labelLicenceCommerciale;

  /// No description provided for @labelDocument.
  ///
  /// In fr, this message translates to:
  /// **'Document'**
  String get labelDocument;

  /// No description provided for @labelImmediat.
  ///
  /// In fr, this message translates to:
  /// **'Immédiat'**
  String get labelImmediat;

  /// No description provided for @labelQuotidien.
  ///
  /// In fr, this message translates to:
  /// **'Quotidien'**
  String get labelQuotidien;

  /// No description provided for @labelHebdomadaire.
  ///
  /// In fr, this message translates to:
  /// **'Hebdomadaire'**
  String get labelHebdomadaire;

  /// No description provided for @labelPayee.
  ///
  /// In fr, this message translates to:
  /// **'Payée'**
  String get labelPayee;

  /// No description provided for @labelEchec.
  ///
  /// In fr, this message translates to:
  /// **'Échec'**
  String get labelEchec;

  /// No description provided for @labelAnnulee.
  ///
  /// In fr, this message translates to:
  /// **'Annulée'**
  String get labelAnnulee;

  /// No description provided for @appLipaAgent.
  ///
  /// In fr, this message translates to:
  /// **'Lipa Agent'**
  String get appLipaAgent;

  /// No description provided for @errorNumeroPinIncorrect.
  ///
  /// In fr, this message translates to:
  /// **'Numéro ou PIN incorrect.'**
  String get errorNumeroPinIncorrect;

  /// No description provided for @errorPinIncorrectReessayez.
  ///
  /// In fr, this message translates to:
  /// **'PIN incorrect. Réessayez.'**
  String get errorPinIncorrectReessayez;

  /// No description provided for @errorPinBloqueReessayezDans.
  ///
  /// In fr, this message translates to:
  /// **'PIN bloqué. Réessayez dans 15 minutes.'**
  String get errorPinBloqueReessayezDans;

  /// No description provided for @errorPinDoitComporter4.
  ///
  /// In fr, this message translates to:
  /// **'Le PIN doit comporter 4 à 8 chiffres.'**
  String get errorPinDoitComporter4;

  /// No description provided for @errorPinDejaDefiniCompte.
  ///
  /// In fr, this message translates to:
  /// **'Un PIN est déjà défini pour ce compte.'**
  String get errorPinDejaDefiniCompte;

  /// No description provided for @errorAucunPinNDefini.
  ///
  /// In fr, this message translates to:
  /// **'Aucun PIN n’est défini pour ce compte.'**
  String get errorAucunPinNDefini;

  /// No description provided for @errorActivezTotpContactezBack.
  ///
  /// In fr, this message translates to:
  /// **'Activez la vérification en deux étapes ou contactez le back-office pour réinitialiser votre PIN.'**
  String get errorActivezTotpContactezBack;

  /// No description provided for @errorLienExpireRecommencezConnexion.
  ///
  /// In fr, this message translates to:
  /// **'Lien expiré. Recommencez la connexion.'**
  String get errorLienExpireRecommencezConnexion;

  /// No description provided for @errorCodeVerificationInvalide.
  ///
  /// In fr, this message translates to:
  /// **'Code de vérification invalide.'**
  String get errorCodeVerificationInvalide;

  /// No description provided for @errorSessionExpireReconnectezVous.
  ///
  /// In fr, this message translates to:
  /// **'Votre session a expiré. Reconnectez-vous.'**
  String get errorSessionExpireReconnectezVous;

  /// No description provided for @errorTropTentativesReessayezDans.
  ///
  /// In fr, this message translates to:
  /// **'Trop de tentatives. Réessayez dans un instant.'**
  String get errorTropTentativesReessayezDans;

  /// No description provided for @errorCompteAgentCoursVerification.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte agent est en cours de vérification.'**
  String get errorCompteAgentCoursVerification;

  /// No description provided for @errorCompteIndisponibleContactezBack.
  ///
  /// In fr, this message translates to:
  /// **'Compte indisponible. Contactez le back-office.'**
  String get errorCompteIndisponibleContactezBack;

  /// No description provided for @errorNiveauVerificationKycInsuffisant.
  ///
  /// In fr, this message translates to:
  /// **'Niveau de vérification (KYC) insuffisant pour cette opération.'**
  String get errorNiveauVerificationKycInsuffisant;

  /// No description provided for @errorSoldeInsuffisantOperation.
  ///
  /// In fr, this message translates to:
  /// **'Solde insuffisant pour cette opération.'**
  String get errorSoldeInsuffisantOperation;

  /// No description provided for @errorMontantInferieurMinimumAutorise.
  ///
  /// In fr, this message translates to:
  /// **'Montant inférieur au minimum autorisé.'**
  String get errorMontantInferieurMinimumAutorise;

  /// No description provided for @errorMontantSuperieurMaximumAutorise.
  ///
  /// In fr, this message translates to:
  /// **'Montant supérieur au maximum autorisé.'**
  String get errorMontantSuperieurMaximumAutorise;

  /// No description provided for @errorMontantDoitEtreSuperieur.
  ///
  /// In fr, this message translates to:
  /// **'Le montant doit être supérieur à zéro.'**
  String get errorMontantDoitEtreSuperieur;

  /// No description provided for @errorPlafondJournalierAtteintConsultez.
  ///
  /// In fr, this message translates to:
  /// **'Plafond journalier atteint. Consultez vos plafonds.'**
  String get errorPlafondJournalierAtteintConsultez;

  /// No description provided for @errorPlafondHebdomadaireAtteintConsultez.
  ///
  /// In fr, this message translates to:
  /// **'Plafond hebdomadaire atteint. Consultez vos plafonds.'**
  String get errorPlafondHebdomadaireAtteintConsultez;

  /// No description provided for @errorPlafondMensuelAtteintConsultez.
  ///
  /// In fr, this message translates to:
  /// **'Plafond mensuel atteint. Consultez vos plafonds.'**
  String get errorPlafondMensuelAtteintConsultez;

  /// No description provided for @errorNombreMaximalOperationsAtteint.
  ///
  /// In fr, this message translates to:
  /// **'Nombre maximal d’opérations atteint. Consultez vos plafonds.'**
  String get errorNombreMaximalOperationsAtteint;

  /// No description provided for @errorServiceTemporairementIndisponibleReessayez.
  ///
  /// In fr, this message translates to:
  /// **'Service temporairement indisponible. Réessayez plus tard.'**
  String get errorServiceTemporairementIndisponibleReessayez;

  /// No description provided for @errorMontantSoumisApprobationBack.
  ///
  /// In fr, this message translates to:
  /// **'Montant soumis à approbation du back-office.'**
  String get errorMontantSoumisApprobationBack;

  /// No description provided for @errorVousNEtesPas.
  ///
  /// In fr, this message translates to:
  /// **'Vous n’êtes pas autorisé à faire des dépôts.'**
  String get errorVousNEtesPas;

  /// No description provided for @errorRetraitMarchandNonAutorise.
  ///
  /// In fr, this message translates to:
  /// **'Retrait marchand non autorisé.'**
  String get errorRetraitMarchandNonAutorise;

  /// No description provided for @errorVousNEtesPas2.
  ///
  /// In fr, this message translates to:
  /// **'Vous n’êtes pas autorisé à vendre ou remplacer des cartes.'**
  String get errorVousNEtesPas2;

  /// No description provided for @errorOperationDejaCoursTraitement.
  ///
  /// In fr, this message translates to:
  /// **'Opération déjà en cours de traitement. Réessayez dans un instant.'**
  String get errorOperationDejaCoursTraitement;

  /// No description provided for @errorDonneesOntChangeEntre.
  ///
  /// In fr, this message translates to:
  /// **'Les données ont changé entre-temps. Réessayez.'**
  String get errorDonneesOntChangeEntre;

  /// No description provided for @errorNumeroNeCorrespondAucun.
  ///
  /// In fr, this message translates to:
  /// **'Ce numéro ne correspond à aucun client Lipa.'**
  String get errorNumeroNeCorrespondAucun;

  /// No description provided for @errorNumeroNeCorrespondAucun2.
  ///
  /// In fr, this message translates to:
  /// **'Ce numéro ne correspond à aucun marchand Lipa.'**
  String get errorNumeroNeCorrespondAucun2;

  /// No description provided for @errorCarteIntrouvableCetUid.
  ///
  /// In fr, this message translates to:
  /// **'Aucune carte ne correspond à cet identifiant.'**
  String get errorCarteIntrouvableCetUid;

  /// No description provided for @errorIntrouvable.
  ///
  /// In fr, this message translates to:
  /// **'Introuvable.'**
  String get errorIntrouvable;

  /// No description provided for @errorNumeroTelephoneDejaUtilise.
  ///
  /// In fr, this message translates to:
  /// **'Ce numéro de téléphone est déjà utilisé.'**
  String get errorNumeroTelephoneDejaUtilise;

  /// No description provided for @errorNumeroPieceIdentiteDeja.
  ///
  /// In fr, this message translates to:
  /// **'Ce numéro de pièce d’identité est déjà utilisé.'**
  String get errorNumeroPieceIdentiteDeja;

  /// No description provided for @errorStockCartesIntrouvable.
  ///
  /// In fr, this message translates to:
  /// **'Stock de cartes introuvable.'**
  String get errorStockCartesIntrouvable;

  /// No description provided for @errorCarteNPasDisponible.
  ///
  /// In fr, this message translates to:
  /// **'Cette carte n’est pas disponible à la vente.'**
  String get errorCarteNPasDisponible;

  /// No description provided for @errorCarteNeVousPas.
  ///
  /// In fr, this message translates to:
  /// **'Cette carte ne vous est pas attribuée.'**
  String get errorCarteNeVousPas;

  /// No description provided for @errorCarteRemplacerNPas.
  ///
  /// In fr, this message translates to:
  /// **'La carte à remplacer n’est pas active.'**
  String get errorCarteRemplacerNPas;

  /// No description provided for @errorOperationNPasPossible.
  ///
  /// In fr, this message translates to:
  /// **'Cette opération n’est pas possible sur cette carte.'**
  String get errorOperationNPasPossible;

  /// No description provided for @errorDonneesInvalidesVerifiezChamps.
  ///
  /// In fr, this message translates to:
  /// **'Données invalides. Vérifiez les champs.'**
  String get errorDonneesInvalidesVerifiezChamps;

  /// No description provided for @errorConnexionImpossibleVerifiezReseau.
  ///
  /// In fr, this message translates to:
  /// **'Connexion impossible. Vérifiez votre réseau.'**
  String get errorConnexionImpossibleVerifiezReseau;

  /// No description provided for @errorErreurSurvenueReessayez.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Réessayez.'**
  String get errorErreurSurvenueReessayez;

  /// No description provided for @errorErreurSurvenueReessayezRef.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Réessayez. (Réf. {ref})'**
  String errorErreurSurvenueReessayezRef(Object ref);

  /// No description provided for @scannerApprochezCarteTelephone.
  ///
  /// In fr, this message translates to:
  /// **'Approchez la carte du téléphone'**
  String get scannerApprochezCarteTelephone;

  /// No description provided for @scannerCarteNonReconnueReessayez.
  ///
  /// In fr, this message translates to:
  /// **'Carte non reconnue. Réessayez ou saisissez son identifiant.'**
  String get scannerCarteNonReconnueReessayez;

  /// No description provided for @scannerLectureNfcInterrompueReessayez.
  ///
  /// In fr, this message translates to:
  /// **'Lecture NFC interrompue. Réessayez.'**
  String get scannerLectureNfcInterrompueReessayez;

  /// No description provided for @scannerLecteurNfcIndisponible.
  ///
  /// In fr, this message translates to:
  /// **'Le lecteur NFC est indisponible.'**
  String get scannerLecteurNfcIndisponible;

  /// No description provided for @scannerApprochezCarteDosTelephone.
  ///
  /// In fr, this message translates to:
  /// **'Approchez la carte du dos du téléphone pour la lire.'**
  String get scannerApprochezCarteDosTelephone;

  /// No description provided for @scannerSaisirUidManuellement.
  ///
  /// In fr, this message translates to:
  /// **'Saisir l’identifiant de la carte'**
  String get scannerSaisirUidManuellement;

  /// No description provided for @scannerSaisirUid.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant de la carte'**
  String get scannerSaisirUid;

  /// No description provided for @scannerSaisissezIdentifiantUidCarte.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez l’identifiant (UID) de la carte : 14 caractères, chiffres 0–9 et lettres A–F.'**
  String get scannerSaisissezIdentifiantUidCarte;

  /// No description provided for @scannerUidInvalide14Caracteres.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant invalide : 14 caractères attendus (0–9, A–F).'**
  String get scannerUidInvalide14Caracteres;

  /// No description provided for @formattersInstant.
  ///
  /// In fr, this message translates to:
  /// **'à l’instant'**
  String get formattersInstant;

  /// No description provided for @formattersIlYMin.
  ///
  /// In fr, this message translates to:
  /// **'il y a {min} min'**
  String formattersIlYMin(Object min);

  /// No description provided for @formattersIlYH.
  ///
  /// In fr, this message translates to:
  /// **'il y a {h} h'**
  String formattersIlYH(Object h);

  /// No description provided for @formattersIlYJ.
  ///
  /// In fr, this message translates to:
  /// **'il y a {days} j'**
  String formattersIlYJ(Object days);

  /// No description provided for @transactionReceiptOperation.
  ///
  /// In fr, this message translates to:
  /// **'Opération : {kind}'**
  String transactionReceiptOperation(Object kind);

  /// No description provided for @transactionReceiptMontantKmf.
  ///
  /// In fr, this message translates to:
  /// **'Montant : {sign}{amount} KMF'**
  String transactionReceiptMontantKmf(Object sign, Object amount);

  /// No description provided for @transactionReceiptStatut.
  ///
  /// In fr, this message translates to:
  /// **'Statut : {state}'**
  String transactionReceiptStatut(Object state);

  /// No description provided for @transactionReceiptDate.
  ///
  /// In fr, this message translates to:
  /// **'Date : {date}'**
  String transactionReceiptDate(Object date);

  /// No description provided for @transactionReceiptFraisKmf.
  ///
  /// In fr, this message translates to:
  /// **'Frais : {amount} KMF'**
  String transactionReceiptFraisKmf(Object amount);

  /// No description provided for @transactionReceiptCommissionKmf.
  ///
  /// In fr, this message translates to:
  /// **'Commission : {amount} KMF'**
  String transactionReceiptCommissionKmf(Object amount);

  /// No description provided for @transactionReceiptMontantNetKmf.
  ///
  /// In fr, this message translates to:
  /// **'Montant net : {amount} KMF'**
  String transactionReceiptMontantNetKmf(Object amount);

  /// No description provided for @transactionReceiptReference.
  ///
  /// In fr, this message translates to:
  /// **'Référence : {id}'**
  String transactionReceiptReference(Object id);

  /// No description provided for @transactionReceiptRecuTransaction.
  ///
  /// In fr, this message translates to:
  /// **'Reçu de transaction'**
  String get transactionReceiptRecuTransaction;

  /// No description provided for @transactionReceiptDate2.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get transactionReceiptDate2;

  /// No description provided for @transactionReceiptMontantNet.
  ///
  /// In fr, this message translates to:
  /// **'Montant net'**
  String get transactionReceiptMontantNet;

  /// No description provided for @transactionReceiptReference2.
  ///
  /// In fr, this message translates to:
  /// **'Référence'**
  String get transactionReceiptReference2;

  /// No description provided for @transactionReceiptRecuGenereApplicationLipa.
  ///
  /// In fr, this message translates to:
  /// **'Ce reçu est généré par l’application Lipa à titre informatif.'**
  String get transactionReceiptRecuGenereApplicationLipa;

  /// No description provided for @transactionReceiptDescription.
  ///
  /// In fr, this message translates to:
  /// **'Description'**
  String get transactionReceiptDescription;

  /// No description provided for @transactionReceiptSolde.
  ///
  /// In fr, this message translates to:
  /// **'Solde'**
  String get transactionReceiptSolde;

  /// No description provided for @transactionReceiptReleveLipa.
  ///
  /// In fr, this message translates to:
  /// **'Relevé Lipa'**
  String get transactionReceiptReleveLipa;

  /// No description provided for @transactionReceiptPage.
  ///
  /// In fr, this message translates to:
  /// **'Page {pageNumber}/{pagesCount}'**
  String transactionReceiptPage(Object pageNumber, Object pagesCount);

  /// No description provided for @transactionReceiptReleveCompte.
  ///
  /// In fr, this message translates to:
  /// **'Relevé du compte'**
  String get transactionReceiptReleveCompte;

  /// No description provided for @transactionReceiptPeriode.
  ///
  /// In fr, this message translates to:
  /// **'Période : {period}'**
  String transactionReceiptPeriode(Object period);

  /// No description provided for @transactionReceiptAucuneEcriturePeriode.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mouvement sur cette période.'**
  String get transactionReceiptAucuneEcriturePeriode;

  /// No description provided for @validatorsNumeroDoitCommencer3.
  ///
  /// In fr, this message translates to:
  /// **'Le numéro doit commencer par 3 ou 4.'**
  String get validatorsNumeroDoitCommencer3;

  /// No description provided for @validatorsNumeroDoitContenir7.
  ///
  /// In fr, this message translates to:
  /// **'Le numéro doit contenir 7 chiffres.'**
  String get validatorsNumeroDoitContenir7;

  /// No description provided for @commonReessayer.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get commonReessayer;

  /// No description provided for @lipaBrandAgent.
  ///
  /// In fr, this message translates to:
  /// **'Agent'**
  String get lipaBrandAgent;

  /// No description provided for @resultOperationDejaTraiteeResultat.
  ///
  /// In fr, this message translates to:
  /// **'Cette opération avait déjà été enregistrée : voici son résultat.'**
  String get resultOperationDejaTraiteeResultat;

  /// No description provided for @resultTermine.
  ///
  /// In fr, this message translates to:
  /// **'Terminé'**
  String get resultTermine;

  /// No description provided for @activityTransactions.
  ///
  /// In fr, this message translates to:
  /// **'Vos transactions'**
  String get activityTransactions;

  /// No description provided for @activityToutes.
  ///
  /// In fr, this message translates to:
  /// **'Toutes'**
  String get activityToutes;

  /// No description provided for @activityEntrees.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get activityEntrees;

  /// No description provided for @activitySorties.
  ///
  /// In fr, this message translates to:
  /// **'Sorties'**
  String get activitySorties;

  /// No description provided for @activityAucuneOperation.
  ///
  /// In fr, this message translates to:
  /// **'Aucune opération'**
  String get activityAucuneOperation;

  /// No description provided for @activityDepotsRetraitsVentesCartes.
  ///
  /// In fr, this message translates to:
  /// **'Vos dépôts, retraits et ventes de cartes apparaîtront ici.'**
  String get activityDepotsRetraitsVentesCartes;

  /// No description provided for @statementEcrituresCompte.
  ///
  /// In fr, this message translates to:
  /// **'Mouvements du compte'**
  String get statementEcrituresCompte;

  /// No description provided for @statementReleveIndisponible.
  ///
  /// In fr, this message translates to:
  /// **'Relevé indisponible.'**
  String get statementReleveIndisponible;

  /// No description provided for @statementReleveVide.
  ///
  /// In fr, this message translates to:
  /// **'Relevé vide'**
  String get statementReleveVide;

  /// No description provided for @statementAucuneEcriturePeriode.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mouvement sur cette période.'**
  String get statementAucuneEcriturePeriode;

  /// No description provided for @statementImpossibleGenererRelevePdf.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de générer le relevé PDF.'**
  String get statementImpossibleGenererRelevePdf;

  /// No description provided for @statementSolde.
  ///
  /// In fr, this message translates to:
  /// **'Solde {amount}'**
  String statementSolde(Object amount);

  /// No description provided for @transactionDetailDetailOperation.
  ///
  /// In fr, this message translates to:
  /// **'Détail de l’opération'**
  String get transactionDetailDetailOperation;

  /// No description provided for @transactionDetailEffectue.
  ///
  /// In fr, this message translates to:
  /// **'Effectué le'**
  String get transactionDetailEffectue;

  /// No description provided for @transactionDetailRefuse.
  ///
  /// In fr, this message translates to:
  /// **'Refusé le'**
  String get transactionDetailRefuse;

  /// No description provided for @transactionDetailCree.
  ///
  /// In fr, this message translates to:
  /// **'Créé le'**
  String get transactionDetailCree;

  /// No description provided for @transactionDetailNetDestinataire.
  ///
  /// In fr, this message translates to:
  /// **'Montant reçu'**
  String get transactionDetailNetDestinataire;

  /// No description provided for @transactionDetailMotifRefus.
  ///
  /// In fr, this message translates to:
  /// **'Motif du refus'**
  String get transactionDetailMotifRefus;

  /// No description provided for @transactionDetailRefTransaction.
  ///
  /// In fr, this message translates to:
  /// **'Réf. transaction'**
  String get transactionDetailRefTransaction;

  /// No description provided for @transactionDetailCorrelation.
  ///
  /// In fr, this message translates to:
  /// **'Référence support'**
  String get transactionDetailCorrelation;

  /// No description provided for @transactionDetailRecuPdf.
  ///
  /// In fr, this message translates to:
  /// **'Reçu PDF'**
  String get transactionDetailRecuPdf;

  /// No description provided for @transactionDetailPartager.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get transactionDetailPartager;

  /// No description provided for @transactionDetailImpossibleGenererRecuPdf.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de générer le reçu PDF.'**
  String get transactionDetailImpossibleGenererRecuPdf;

  /// No description provided for @transactionDetailRecuLipa.
  ///
  /// In fr, this message translates to:
  /// **'Reçu Lipa'**
  String get transactionDetailRecuLipa;

  /// No description provided for @agentShellAccueil.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get agentShellAccueil;

  /// No description provided for @authNoticesVousAvezEteDeconnecte.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez été déconnecté'**
  String get authNoticesVousAvezEteDeconnecte;

  /// No description provided for @authNoticesReconnectezVousContinuerOperations.
  ///
  /// In fr, this message translates to:
  /// **'Reconnectez-vous pour continuer vos opérations agent Lipa.'**
  String get authNoticesReconnectezVousContinuerOperations;

  /// No description provided for @authNoticesSeReconnecter.
  ///
  /// In fr, this message translates to:
  /// **'Se reconnecter'**
  String get authNoticesSeReconnecter;

  /// No description provided for @authNoticesSaisiePinBloquee.
  ///
  /// In fr, this message translates to:
  /// **'Saisie du PIN bloquée'**
  String get authNoticesSaisiePinBloquee;

  /// No description provided for @authNoticesPinIncorrectSaisi3.
  ///
  /// In fr, this message translates to:
  /// **'PIN incorrect saisi 3 fois. Réessayez dans 15 minutes.'**
  String get authNoticesPinIncorrectSaisi3;

  /// No description provided for @authNoticesReinitialiserMonPin.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser mon PIN'**
  String get authNoticesReinitialiserMonPin;

  /// No description provided for @authEspaceAgent.
  ///
  /// In fr, this message translates to:
  /// **'Espace agent'**
  String get authEspaceAgent;

  /// No description provided for @authConnectezVousGererOperations.
  ///
  /// In fr, this message translates to:
  /// **'Connectez-vous pour gérer vos opérations cash et l’enrôlement client.'**
  String get authConnectezVousGererOperations;

  /// No description provided for @authVerifiezIdentite.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez votre identité'**
  String get authVerifiezIdentite;

  /// No description provided for @authSaisissezCode6Chiffres.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez le code à 6 chiffres de votre application d’authentification.'**
  String get authSaisissezCode6Chiffres;

  /// No description provided for @authDefinirPin.
  ///
  /// In fr, this message translates to:
  /// **'Définir votre PIN'**
  String get authDefinirPin;

  /// No description provided for @authChoisissezPinProtegeraCompte.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez le PIN qui protégera votre compte agent et vos opérations.'**
  String get authChoisissezPinProtegeraCompte;

  /// No description provided for @authPinOublie.
  ///
  /// In fr, this message translates to:
  /// **'PIN oublié'**
  String get authPinOublie;

  /// No description provided for @authReinitialisezPinAvecCode.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialisez votre PIN avec le code de votre application d’authentification.'**
  String get authReinitialisezPinAvecCode;

  /// No description provided for @authSessionExpiree.
  ///
  /// In fr, this message translates to:
  /// **'Session expirée'**
  String get authSessionExpiree;

  /// No description provided for @authVousAvezEteDeconnecte.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez été déconnecté afin de protéger votre compte agent.'**
  String get authVousAvezEteDeconnecte;

  /// No description provided for @authPinBloque.
  ///
  /// In fr, this message translates to:
  /// **'PIN bloqué'**
  String get authPinBloque;

  /// No description provided for @authTropTentativesIncorrectesReessayez.
  ///
  /// In fr, this message translates to:
  /// **'Trop de tentatives incorrectes. Réessayez dans 15 minutes.'**
  String get authTropTentativesIncorrectesReessayez;

  /// No description provided for @forgotPinReinitialisationPossibleUniquementSi.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialisation possible uniquement si la vérification en deux étapes est activée. Sinon, contactez le back-office Lipa.'**
  String get forgotPinReinitialisationPossibleUniquementSi;

  /// No description provided for @forgotPinCodeAuthentificationTotp.
  ///
  /// In fr, this message translates to:
  /// **'Code de l’application d’authentification'**
  String get forgotPinCodeAuthentificationTotp;

  /// No description provided for @forgotPinReinitialiserPin.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser le PIN'**
  String get forgotPinReinitialiserPin;

  /// No description provided for @loginPinReinitialiseConnectezVous.
  ///
  /// In fr, this message translates to:
  /// **'PIN réinitialisé. Connectez-vous avec votre nouveau PIN.'**
  String get loginPinReinitialiseConnectezVous;

  /// No description provided for @login48Chiffres.
  ///
  /// In fr, this message translates to:
  /// **'4 à 8 chiffres'**
  String get login48Chiffres;

  /// No description provided for @loginSaisissezPin.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez votre PIN'**
  String get loginSaisissezPin;

  /// No description provided for @loginSeConnecter.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get loginSeConnecter;

  /// No description provided for @loginPinOublie.
  ///
  /// In fr, this message translates to:
  /// **'PIN oublié ?'**
  String get loginPinOublie;

  /// No description provided for @loginPinPersonnel.
  ///
  /// In fr, this message translates to:
  /// **'Votre PIN est personnel. '**
  String get loginPinPersonnel;

  /// No description provided for @loginNeCommuniquezJamaisPin.
  ///
  /// In fr, this message translates to:
  /// **'Ne le communiquez jamais, même au back-office Lipa.'**
  String get loginNeCommuniquezJamaisPin;

  /// No description provided for @mfaVerifierContinuer.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier et continuer'**
  String get mfaVerifierContinuer;

  /// No description provided for @pinSetupConfigurationUniqueChoisissezPin.
  ///
  /// In fr, this message translates to:
  /// **'Configuration unique. Choisissez un PIN de 4 à 8 chiffres.'**
  String get pinSetupConfigurationUniqueChoisissezPin;

  /// No description provided for @pinSetupEnregistrerPin.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer le PIN'**
  String get pinSetupEnregistrerPin;

  /// No description provided for @cardsStockAttribue.
  ///
  /// In fr, this message translates to:
  /// **'Stock attribué'**
  String get cardsStockAttribue;

  /// No description provided for @cardsCartesDisponibles.
  ///
  /// In fr, this message translates to:
  /// **'Cartes disponibles'**
  String get cardsCartesDisponibles;

  /// No description provided for @cardsStockVide.
  ///
  /// In fr, this message translates to:
  /// **'Stock vide'**
  String get cardsStockVide;

  /// No description provided for @cardsAucuneCarteAttribueeContactez.
  ///
  /// In fr, this message translates to:
  /// **'Aucune carte attribuée. Contactez le back-office pour un réapprovisionnement.'**
  String get cardsAucuneCarteAttribueeContactez;

  /// No description provided for @cardsAttribuee.
  ///
  /// In fr, this message translates to:
  /// **'Attribuée le {date}'**
  String cardsAttribuee(Object date);

  /// No description provided for @cardsLot.
  ///
  /// In fr, this message translates to:
  /// **'Lot {batchRef}'**
  String cardsLot(Object batchRef);

  /// No description provided for @cardLookupDeclarerVolee.
  ///
  /// In fr, this message translates to:
  /// **'Déclarer volée'**
  String get cardLookupDeclarerVolee;

  /// No description provided for @cardLookupDeclarerPerdue.
  ///
  /// In fr, this message translates to:
  /// **'Déclarer perdue'**
  String get cardLookupDeclarerPerdue;

  /// No description provided for @cardLookupConfirmerCarteVoleeElle.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer que cette carte est volée ? Elle sera bloquée immédiatement.'**
  String get cardLookupConfirmerCarteVoleeElle;

  /// No description provided for @cardLookupConfirmerCartePerdueElle.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer que cette carte est perdue ? Elle sera bloquée immédiatement.'**
  String get cardLookupConfirmerCartePerdueElle;

  /// No description provided for @cardLookupCarteDeclareeVolee.
  ///
  /// In fr, this message translates to:
  /// **'Carte déclarée volée'**
  String get cardLookupCarteDeclareeVolee;

  /// No description provided for @cardLookupCarteDeclareePerdue.
  ///
  /// In fr, this message translates to:
  /// **'Carte déclarée perdue'**
  String get cardLookupCarteDeclareePerdue;

  /// No description provided for @cardLookupUidNfc.
  ///
  /// In fr, this message translates to:
  /// **'Carte perdue, volée ou à remplacer'**
  String get cardLookupUidNfc;

  /// No description provided for @cardLookupScannezCarteClientSaisissez.
  ///
  /// In fr, this message translates to:
  /// **'Scannez la carte du client (ou saisissez son identifiant) pour la retrouver, puis déclarez-la perdue ou volée, ou remplacez-la.'**
  String get cardLookupScannezCarteClientSaisissez;

  /// No description provided for @cardLookupScannerAutreCarte.
  ///
  /// In fr, this message translates to:
  /// **'Scanner une autre carte'**
  String get cardLookupScannerAutreCarte;

  /// No description provided for @cardLookupCarteNPasEncore.
  ///
  /// In fr, this message translates to:
  /// **'Cette carte n’est pas encore liée à un client. Perte, vol et remplacement ne concernent que les cartes vendues.'**
  String get cardLookupCarteNPasEncore;

  /// No description provided for @cardLookupCarte.
  ///
  /// In fr, this message translates to:
  /// **'Carte'**
  String get cardLookupCarte;

  /// No description provided for @cardLookupUidNfc2.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant (UID)'**
  String get cardLookupUidNfc2;

  /// No description provided for @cardLookupTitulaire.
  ///
  /// In fr, this message translates to:
  /// **'Titulaire'**
  String get cardLookupTitulaire;

  /// No description provided for @cardLookupTelephone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get cardLookupTelephone;

  /// No description provided for @cardReplaceRemplacement.
  ///
  /// In fr, this message translates to:
  /// **'Remplacement'**
  String get cardReplaceRemplacement;

  /// No description provided for @cardReplaceCarteRemplacee.
  ///
  /// In fr, this message translates to:
  /// **'Carte remplacée'**
  String get cardReplaceCarteRemplacee;

  /// No description provided for @cardReplaceNouvelleCarteActiveeClient.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle carte activée pour le client.'**
  String get cardReplaceNouvelleCarteActiveeClient;

  /// No description provided for @cardReplaceFraisFactures.
  ///
  /// In fr, this message translates to:
  /// **'Frais facturés'**
  String get cardReplaceFraisFactures;

  /// No description provided for @cardReplaceNouvelleCarte.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle carte'**
  String get cardReplaceNouvelleCarte;

  /// No description provided for @cardReplaceAncienneCarte.
  ///
  /// In fr, this message translates to:
  /// **'Ancienne carte'**
  String get cardReplaceAncienneCarte;

  /// No description provided for @cardReplaceChoisissezCarteStockAttribue.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez une carte de votre stock attribué pour remplacer la carte du client.'**
  String get cardReplaceChoisissezCarteStockAttribue;

  /// No description provided for @cardReplaceCarteRemplacement.
  ///
  /// In fr, this message translates to:
  /// **'Carte de remplacement'**
  String get cardReplaceCarteRemplacement;

  /// No description provided for @cardReplaceAucuneCarteDisponibleDans.
  ///
  /// In fr, this message translates to:
  /// **'Aucune carte disponible dans votre stock attribué.'**
  String get cardReplaceAucuneCarteDisponibleDans;

  /// No description provided for @cardReplaceFraisRemplacement.
  ///
  /// In fr, this message translates to:
  /// **'Frais de remplacement'**
  String get cardReplaceFraisRemplacement;

  /// No description provided for @cardReplaceRemplacer.
  ///
  /// In fr, this message translates to:
  /// **'Remplacer pour {amount}'**
  String cardReplaceRemplacer(Object amount);

  /// No description provided for @cardSaleCarteVendue.
  ///
  /// In fr, this message translates to:
  /// **'Carte vendue'**
  String get cardSaleCarteVendue;

  /// No description provided for @cardSaleClient.
  ///
  /// In fr, this message translates to:
  /// **'le client'**
  String get cardSaleClient;

  /// No description provided for @cardSaleCarteActivee.
  ///
  /// In fr, this message translates to:
  /// **'Carte activée pour {client}.'**
  String cardSaleCarteActivee(Object client);

  /// No description provided for @cardSalePrixFacture.
  ///
  /// In fr, this message translates to:
  /// **'Prix facturé'**
  String get cardSalePrixFacture;

  /// No description provided for @cardSaleDepuisStock.
  ///
  /// In fr, this message translates to:
  /// **'Depuis votre stock'**
  String get cardSaleDepuisStock;

  /// No description provided for @cardSaleClient2.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get cardSaleClient2;

  /// No description provided for @cardSaleCarteNfc.
  ///
  /// In fr, this message translates to:
  /// **'Carte'**
  String get cardSaleCarteNfc;

  /// No description provided for @cardSalePrixCarte.
  ///
  /// In fr, this message translates to:
  /// **'Prix de la carte'**
  String get cardSalePrixCarte;

  /// No description provided for @cardSaleVendre.
  ///
  /// In fr, this message translates to:
  /// **'Vendre pour {amount}'**
  String cardSaleVendre(Object amount);

  /// No description provided for @cardSaleVendreCarte.
  ///
  /// In fr, this message translates to:
  /// **'Vendre la carte'**
  String get cardSaleVendreCarte;

  /// No description provided for @cardSaleCarteSelectionnee.
  ///
  /// In fr, this message translates to:
  /// **'Carte sélectionnée'**
  String get cardSaleCarteSelectionnee;

  /// No description provided for @cardSaleChanger.
  ///
  /// In fr, this message translates to:
  /// **'Changer'**
  String get cardSaleChanger;

  /// No description provided for @cashInSaisissezNumeroClientConfirmer.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez le numéro du client pour confirmer son identité avant le dépôt.'**
  String get cashInSaisissezNumeroClientConfirmer;

  /// No description provided for @cashInChangerClient.
  ///
  /// In fr, this message translates to:
  /// **'Changer de client'**
  String get cashInChangerClient;

  /// No description provided for @cashInMontantDeposer.
  ///
  /// In fr, this message translates to:
  /// **'Montant à déposer'**
  String get cashInMontantDeposer;

  /// No description provided for @cashInDeposer.
  ///
  /// In fr, this message translates to:
  /// **'Déposer {amount}'**
  String cashInDeposer(Object amount);

  /// No description provided for @cashInDeposer2.
  ///
  /// In fr, this message translates to:
  /// **'Déposer'**
  String get cashInDeposer2;

  /// No description provided for @cashInFloatSeraDebiteMontant.
  ///
  /// In fr, this message translates to:
  /// **'Votre float sera débité du montant déposé.'**
  String get cashInFloatSeraDebiteMontant;

  /// No description provided for @cashInDepotEffectue.
  ///
  /// In fr, this message translates to:
  /// **'Dépôt effectué'**
  String get cashInDepotEffectue;

  /// No description provided for @cashInCredites.
  ///
  /// In fr, this message translates to:
  /// **'{amount} crédités à {customerName}.'**
  String cashInCredites(Object amount, Object customerName);

  /// No description provided for @cashInCrediteClient.
  ///
  /// In fr, this message translates to:
  /// **'Crédité au client'**
  String get cashInCrediteClient;

  /// No description provided for @cashOutPinMarchand.
  ///
  /// In fr, this message translates to:
  /// **'PIN du marchand'**
  String get cashOutPinMarchand;

  /// No description provided for @cashOutDemandezMarchandSaisirSon.
  ///
  /// In fr, this message translates to:
  /// **'Demandez au marchand de saisir son PIN pour autoriser le retrait de {amount}.'**
  String cashOutDemandezMarchandSaisirSon(Object amount);

  /// No description provided for @cashOutSaisissezNumeroMarchandConfirmer.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez le numéro du marchand pour confirmer le bénéficiaire du retrait.'**
  String get cashOutSaisissezNumeroMarchandConfirmer;

  /// No description provided for @cashOutNumeroMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Numéro du marchand'**
  String get cashOutNumeroMarchand;

  /// No description provided for @cashOutRechercherMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher le marchand'**
  String get cashOutRechercherMarchand;

  /// No description provided for @cashOutRetraitBloque.
  ///
  /// In fr, this message translates to:
  /// **'Retrait bloqué'**
  String get cashOutRetraitBloque;

  /// No description provided for @cashOutMarchandNPasAutorise.
  ///
  /// In fr, this message translates to:
  /// **'Ce marchand n’est pas autorisé à effectuer des retraits.'**
  String get cashOutMarchandNPasAutorise;

  /// No description provided for @cashOutChangerMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Changer de marchand'**
  String get cashOutChangerMarchand;

  /// No description provided for @cashOutMontantRetirer.
  ///
  /// In fr, this message translates to:
  /// **'Montant à retirer'**
  String get cashOutMontantRetirer;

  /// No description provided for @cashOutMontantSuperieurSeuilConfirmez.
  ///
  /// In fr, this message translates to:
  /// **'Montant supérieur au seuil de {amount}. Confirmez pour poursuivre.'**
  String cashOutMontantSuperieurSeuilConfirmez(Object amount);

  /// No description provided for @cashOutConfirmerRetrait.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le retrait'**
  String get cashOutConfirmerRetrait;

  /// No description provided for @cashOutRetirer.
  ///
  /// In fr, this message translates to:
  /// **'Retirer {amount}'**
  String cashOutRetirer(Object amount);

  /// No description provided for @cashOutRetirer2.
  ///
  /// In fr, this message translates to:
  /// **'Retirer'**
  String get cashOutRetirer2;

  /// No description provided for @cashOutMarchandDebiteFloatCredite.
  ///
  /// In fr, this message translates to:
  /// **'Le marchand est débité, votre float est crédité.'**
  String get cashOutMarchandDebiteFloatCredite;

  /// No description provided for @cashOutApprobationRequise.
  ///
  /// In fr, this message translates to:
  /// **'Approbation requise'**
  String get cashOutApprobationRequise;

  /// No description provided for @cashOutRetraitDepasseSeuilEte.
  ///
  /// In fr, this message translates to:
  /// **'Ce retrait de {amount} dépasse le seuil et a été transmis au back-office pour approbation. Aucun mouvement n’a encore eu lieu.'**
  String cashOutRetraitDepasseSeuilEte(Object amount);

  /// No description provided for @cashOutSeuil.
  ///
  /// In fr, this message translates to:
  /// **'Seuil'**
  String get cashOutSeuil;

  /// No description provided for @cashOutRefApprobation.
  ///
  /// In fr, this message translates to:
  /// **'Réf. approbation'**
  String get cashOutRefApprobation;

  /// No description provided for @cashOutRetraitEffectue.
  ///
  /// In fr, this message translates to:
  /// **'Retrait effectué'**
  String get cashOutRetraitEffectue;

  /// No description provided for @cashOutRetires.
  ///
  /// In fr, this message translates to:
  /// **'{amount} retirés pour {merchantName}.'**
  String cashOutRetires(Object amount, Object merchantName);

  /// No description provided for @commissionsVersements.
  ///
  /// In fr, this message translates to:
  /// **'Vos versements'**
  String get commissionsVersements;

  /// No description provided for @commissionsCommissionsIndisponibles.
  ///
  /// In fr, this message translates to:
  /// **'Commissions indisponibles.'**
  String get commissionsCommissionsIndisponibles;

  /// No description provided for @commissionsAucuneCommission.
  ///
  /// In fr, this message translates to:
  /// **'Aucune commission'**
  String get commissionsAucuneCommission;

  /// No description provided for @commissionsCommissionsDepotsRetraitsVentes.
  ///
  /// In fr, this message translates to:
  /// **'Vos commissions sur dépôts, retraits et ventes apparaîtront ici.'**
  String get commissionsCommissionsDepotsRetraitsVentes;

  /// No description provided for @commissionsTotalVerse.
  ///
  /// In fr, this message translates to:
  /// **'Total versé'**
  String get commissionsTotalVerse;

  /// No description provided for @commissionsSur.
  ///
  /// In fr, this message translates to:
  /// **'Sur {amount}'**
  String commissionsSur(Object amount);

  /// No description provided for @enrollDateNaissance.
  ///
  /// In fr, this message translates to:
  /// **'Date de naissance'**
  String get enrollDateNaissance;

  /// No description provided for @enrollNouveauCompteKyc.
  ///
  /// In fr, this message translates to:
  /// **'Compte et pièces KYC'**
  String get enrollNouveauCompteKyc;

  /// No description provided for @enrollNomComplet.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get enrollNomComplet;

  /// No description provided for @enrollPrenomNom.
  ///
  /// In fr, this message translates to:
  /// **'Prénom et nom'**
  String get enrollPrenomNom;

  /// No description provided for @enrollTypePiece.
  ///
  /// In fr, this message translates to:
  /// **'Type de pièce'**
  String get enrollTypePiece;

  /// No description provided for @enrollNumeroPiece.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de pièce'**
  String get enrollNumeroPiece;

  /// No description provided for @enrollNPieceIdentite.
  ///
  /// In fr, this message translates to:
  /// **'N° de la pièce d’identité'**
  String get enrollNPieceIdentite;

  /// No description provided for @enrollAdresseFacultatif.
  ///
  /// In fr, this message translates to:
  /// **'Adresse (facultatif)'**
  String get enrollAdresseFacultatif;

  /// No description provided for @enrollIle.
  ///
  /// In fr, this message translates to:
  /// **'Île'**
  String get enrollIle;

  /// No description provided for @enrollVille.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get enrollVille;

  /// No description provided for @enrollQuartier.
  ///
  /// In fr, this message translates to:
  /// **'Quartier'**
  String get enrollQuartier;

  /// No description provided for @enrollCreerCompteClient.
  ///
  /// In fr, this message translates to:
  /// **'Créer le compte client'**
  String get enrollCreerCompteClient;

  /// No description provided for @enrollSelectionnerDate.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner une date'**
  String get enrollSelectionnerDate;

  /// No description provided for @enrollCarteNationale.
  ///
  /// In fr, this message translates to:
  /// **'Carte nationale'**
  String get enrollCarteNationale;

  /// No description provided for @enrollEnrolement.
  ///
  /// In fr, this message translates to:
  /// **'Enrôlement'**
  String get enrollEnrolement;

  /// No description provided for @enrollClientEnrole.
  ///
  /// In fr, this message translates to:
  /// **'Client enrôlé'**
  String get enrollClientEnrole;

  /// No description provided for @enrollEteCreeAvecCompte.
  ///
  /// In fr, this message translates to:
  /// **'{name} a été créé avec un compte actif. Ajoutez ses pièces KYC maintenant.'**
  String enrollEteCreeAvecCompte(Object name);

  /// No description provided for @enrollAjouterDocumentsKyc.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter des documents KYC'**
  String get enrollAjouterDocumentsKyc;

  /// No description provided for @enrollReferenceClient.
  ///
  /// In fr, this message translates to:
  /// **'Référence client'**
  String get enrollReferenceClient;

  /// No description provided for @enrollIdClient.
  ///
  /// In fr, this message translates to:
  /// **'ID client'**
  String get enrollIdClient;

  /// No description provided for @enrollCompte.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get enrollCompte;

  /// No description provided for @kycCustomerCompleterDossierClient.
  ///
  /// In fr, this message translates to:
  /// **'Compléter le dossier d’un client'**
  String get kycCustomerCompleterDossierClient;

  /// No description provided for @kycCustomerGererDocumentsKyc.
  ///
  /// In fr, this message translates to:
  /// **'Gérer les documents KYC'**
  String get kycCustomerGererDocumentsKyc;

  /// No description provided for @kycCustomerDocumentsEnvoyesSontExamines.
  ///
  /// In fr, this message translates to:
  /// **'Les documents envoyés sont examinés par le back-office, qui décide du rehaussement du niveau KYC.'**
  String get kycCustomerDocumentsEnvoyesSontExamines;

  /// No description provided for @kycCustomerNiveauVerifiePieceIdentite.
  ///
  /// In fr, this message translates to:
  /// **'Pour le niveau Vérifié : pièce d’identité (CNI ou passeport) et justificatif de domicile.'**
  String get kycCustomerNiveauVerifiePieceIdentite;

  /// No description provided for @kycCustomerNiveauRenforceJustificatifsComplementaires.
  ///
  /// In fr, this message translates to:
  /// **'Pour le niveau Renforcé : justificatifs complémentaires demandés par le back-office.'**
  String get kycCustomerNiveauRenforceJustificatifsComplementaires;

  /// No description provided for @kycCustomerNiveauKycActuel.
  ///
  /// In fr, this message translates to:
  /// **'Niveau KYC actuel'**
  String get kycCustomerNiveauKycActuel;

  /// No description provided for @kycCustomerNiveauMaximalAtteint.
  ///
  /// In fr, this message translates to:
  /// **'Niveau maximal atteint.'**
  String get kycCustomerNiveauMaximalAtteint;

  /// No description provided for @kycDocumentsImageTropVolumineuse10.
  ///
  /// In fr, this message translates to:
  /// **'Image trop volumineuse (10 Mo maximum).'**
  String get kycDocumentsImageTropVolumineuse10;

  /// No description provided for @kycDocumentsDocumentEnvoye.
  ///
  /// In fr, this message translates to:
  /// **'Document envoyé'**
  String get kycDocumentsDocumentEnvoye;

  /// No description provided for @kycDocumentsPrendrePhoto.
  ///
  /// In fr, this message translates to:
  /// **'Prendre une photo'**
  String get kycDocumentsPrendrePhoto;

  /// No description provided for @kycDocumentsChoisirDansGalerie.
  ///
  /// In fr, this message translates to:
  /// **'Choisir dans la galerie'**
  String get kycDocumentsChoisirDansGalerie;

  /// No description provided for @kycDocumentsDocumentsKyc.
  ///
  /// In fr, this message translates to:
  /// **'Documents KYC'**
  String get kycDocumentsDocumentsKyc;

  /// No description provided for @kycDocumentsTypeDocumentEnvoyer.
  ///
  /// In fr, this message translates to:
  /// **'Type de document à envoyer'**
  String get kycDocumentsTypeDocumentEnvoyer;

  /// No description provided for @kycDocumentsAjouterDocument.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un document'**
  String get kycDocumentsAjouterDocument;

  /// No description provided for @kycDocumentsImage10MoMaximum.
  ///
  /// In fr, this message translates to:
  /// **'Image, 10 Mo maximum.'**
  String get kycDocumentsImage10MoMaximum;

  /// No description provided for @kycDocumentsDocumentsDejaEnvoyes.
  ///
  /// In fr, this message translates to:
  /// **'Documents déjà envoyés'**
  String get kycDocumentsDocumentsDejaEnvoyes;

  /// No description provided for @kycDocumentsAucunDocument.
  ///
  /// In fr, this message translates to:
  /// **'Aucun document'**
  String get kycDocumentsAucunDocument;

  /// No description provided for @kycDocumentsAjoutezPieceIdentiteClient.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez la pièce d’identité du client et tout justificatif requis.'**
  String get kycDocumentsAjoutezPieceIdentiteClient;

  /// No description provided for @kycDocumentsVerifiezDocument.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez le document — {typeLabel}'**
  String kycDocumentsVerifiezDocument(Object typeLabel);

  /// No description provided for @kycDocumentsConfirmerEnvoi.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer l’envoi'**
  String get kycDocumentsConfirmerEnvoi;

  /// No description provided for @kycDocumentsReprendre.
  ///
  /// In fr, this message translates to:
  /// **'Reprendre'**
  String get kycDocumentsReprendre;

  /// No description provided for @floatCardFloatDisponible.
  ///
  /// In fr, this message translates to:
  /// **'Float disponible'**
  String get floatCardFloatDisponible;

  /// No description provided for @floatCardKmfReservesCompte.
  ///
  /// In fr, this message translates to:
  /// **'{amount} KMF réservés · Compte '**
  String floatCardKmfReservesCompte(Object amount);

  /// No description provided for @floatCardFloatSousSeuilAlerte.
  ///
  /// In fr, this message translates to:
  /// **'Float sous le seuil d’alerte ({amount}). Pensez à réapprovisionner.'**
  String floatCardFloatSousSeuilAlerte(Object amount);

  /// No description provided for @homeAgentLipa.
  ///
  /// In fr, this message translates to:
  /// **'Lipa Agent'**
  String get homeAgentLipa;

  /// No description provided for @homeAujourdHui.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get homeAujourdHui;

  /// No description provided for @homeOperationsRapides.
  ///
  /// In fr, this message translates to:
  /// **'Opérations rapides'**
  String get homeOperationsRapides;

  /// No description provided for @homeActiviteRecente.
  ///
  /// In fr, this message translates to:
  /// **'Activité récente'**
  String get homeActiviteRecente;

  /// No description provided for @homeAucuneOperationMoment.
  ///
  /// In fr, this message translates to:
  /// **'Aucune opération pour le moment.'**
  String get homeAucuneOperationMoment;

  /// No description provided for @summaryGridResumeIndisponible.
  ///
  /// In fr, this message translates to:
  /// **'Résumé indisponible.'**
  String get summaryGridResumeIndisponible;

  /// No description provided for @summaryGridVolume.
  ///
  /// In fr, this message translates to:
  /// **'Volume'**
  String get summaryGridVolume;

  /// No description provided for @summaryGridOperations.
  ///
  /// In fr, this message translates to:
  /// **'Opérations'**
  String get summaryGridOperations;

  /// No description provided for @notificationsNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notificationsNotifications;

  /// No description provided for @notificationsToutLire.
  ///
  /// In fr, this message translates to:
  /// **'Tout lire'**
  String get notificationsToutLire;

  /// No description provided for @notificationsNotificationsIndisponibles.
  ///
  /// In fr, this message translates to:
  /// **'Notifications indisponibles.'**
  String get notificationsNotificationsIndisponibles;

  /// No description provided for @notificationsAucuneNotification.
  ///
  /// In fr, this message translates to:
  /// **'Aucune notification'**
  String get notificationsAucuneNotification;

  /// No description provided for @notificationsAlertesApparaitrontIciQu.
  ///
  /// In fr, this message translates to:
  /// **'Vos alertes apparaîtront ici dès qu’elles seront disponibles.'**
  String get notificationsAlertesApparaitrontIciQu;

  /// No description provided for @notificationsDepotCredite.
  ///
  /// In fr, this message translates to:
  /// **'Dépôt crédité'**
  String get notificationsDepotCredite;

  /// No description provided for @notificationsRetraitMarchandEffectue.
  ///
  /// In fr, this message translates to:
  /// **'Retrait marchand effectué'**
  String get notificationsRetraitMarchandEffectue;

  /// No description provided for @notificationsNotification.
  ///
  /// In fr, this message translates to:
  /// **'Notification'**
  String get notificationsNotification;

  /// No description provided for @operationsHubEspeces.
  ///
  /// In fr, this message translates to:
  /// **'Espèces'**
  String get operationsHubEspeces;

  /// No description provided for @operationsHubCrediterCompteClient.
  ///
  /// In fr, this message translates to:
  /// **'Créditer le compte d’un client'**
  String get operationsHubCrediterCompteClient;

  /// No description provided for @quickOpsCrediterClient.
  ///
  /// In fr, this message translates to:
  /// **'Créditer un client'**
  String get quickOpsCrediterClient;

  /// No description provided for @quickOpsRemettreEspeces.
  ///
  /// In fr, this message translates to:
  /// **'Remettre des espèces'**
  String get quickOpsRemettreEspeces;

  /// No description provided for @quickOpsCompteKyc.
  ///
  /// In fr, this message translates to:
  /// **'Compte et KYC'**
  String get quickOpsCompteKyc;

  /// No description provided for @operationsHubDecaisserMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Remettre des espèces à un marchand'**
  String get operationsHubDecaisserMarchand;

  /// No description provided for @operationsHubOperationsEspecesNeSont.
  ///
  /// In fr, this message translates to:
  /// **'Les opérations espèces ne sont pas activées sur votre compte.'**
  String get operationsHubOperationsEspecesNeSont;

  /// No description provided for @operationsHubClients.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get operationsHubClients;

  /// No description provided for @operationsHubCreerCompteKyc.
  ///
  /// In fr, this message translates to:
  /// **'Créer son compte et ajouter ses pièces KYC'**
  String get operationsHubCreerCompteKyc;

  /// No description provided for @operationsHubCompleterDossierClientExistant.
  ///
  /// In fr, this message translates to:
  /// **'Compléter le dossier d’un client existant'**
  String get operationsHubCompleterDossierClientExistant;

  /// No description provided for @operationsHubUidNfcPerteVol.
  ///
  /// In fr, this message translates to:
  /// **'Carte perdue, volée ou à remplacer'**
  String get operationsHubUidNfcPerteVol;

  /// No description provided for @operationsHubDepuisStockAttribue.
  ///
  /// In fr, this message translates to:
  /// **'Depuis votre stock attribué'**
  String get operationsHubDepuisStockAttribue;

  /// No description provided for @limitsLimitesTransaction.
  ///
  /// In fr, this message translates to:
  /// **'Limites de transaction'**
  String get limitsLimitesTransaction;

  /// No description provided for @limitsPlafondsIndisponibles.
  ///
  /// In fr, this message translates to:
  /// **'Plafonds indisponibles.'**
  String get limitsPlafondsIndisponibles;

  /// No description provided for @limitsAucunPlafondConfigure.
  ///
  /// In fr, this message translates to:
  /// **'Aucun plafond configuré'**
  String get limitsAucunPlafondConfigure;

  /// No description provided for @limitsAucunProfilLimitesN.
  ///
  /// In fr, this message translates to:
  /// **'Aucun profil de limites n’est attribué à votre compte.'**
  String get limitsAucunProfilLimitesN;

  /// No description provided for @limitsKycRequis.
  ///
  /// In fr, this message translates to:
  /// **'KYC requis : {requiredKycLevel}'**
  String limitsKycRequis(Object requiredKycLevel);

  /// No description provided for @limitsTransaction.
  ///
  /// In fr, this message translates to:
  /// **'Par transaction'**
  String get limitsTransaction;

  /// No description provided for @limitsMinimum.
  ///
  /// In fr, this message translates to:
  /// **'Minimum'**
  String get limitsMinimum;

  /// No description provided for @limitsMaximum.
  ///
  /// In fr, this message translates to:
  /// **'Maximum'**
  String get limitsMaximum;

  /// No description provided for @limitsCumuls.
  ///
  /// In fr, this message translates to:
  /// **'Cumuls'**
  String get limitsCumuls;

  /// No description provided for @limitsPlafondJournalier.
  ///
  /// In fr, this message translates to:
  /// **'Plafond journalier'**
  String get limitsPlafondJournalier;

  /// No description provided for @limitsPlafondHebdomadaire.
  ///
  /// In fr, this message translates to:
  /// **'Plafond hebdomadaire'**
  String get limitsPlafondHebdomadaire;

  /// No description provided for @limitsPlafondMensuel.
  ///
  /// In fr, this message translates to:
  /// **'Plafond mensuel'**
  String get limitsPlafondMensuel;

  /// No description provided for @limitsTransactionsJour.
  ///
  /// In fr, this message translates to:
  /// **'Transactions / jour'**
  String get limitsTransactionsJour;

  /// No description provided for @limitsTransactionsMois.
  ///
  /// In fr, this message translates to:
  /// **'Transactions / mois'**
  String get limitsTransactionsMois;

  /// No description provided for @limitsNonDefini.
  ///
  /// In fr, this message translates to:
  /// **'Non défini'**
  String get limitsNonDefini;

  /// No description provided for @profileReferenceAgent.
  ///
  /// In fr, this message translates to:
  /// **'Référence agent'**
  String get profileReferenceAgent;

  /// No description provided for @profileZone.
  ///
  /// In fr, this message translates to:
  /// **'Zone'**
  String get profileZone;

  /// No description provided for @profileNiveauKyc.
  ///
  /// In fr, this message translates to:
  /// **'Niveau KYC'**
  String get profileNiveauKyc;

  /// No description provided for @profileContrat.
  ///
  /// In fr, this message translates to:
  /// **'Contrat'**
  String get profileContrat;

  /// No description provided for @profileSeuilAlerteFloat.
  ///
  /// In fr, this message translates to:
  /// **'Seuil d’alerte float'**
  String get profileSeuilAlerteFloat;

  /// No description provided for @profileAutorisations.
  ///
  /// In fr, this message translates to:
  /// **'Autorisations'**
  String get profileAutorisations;

  /// No description provided for @profileDepots.
  ///
  /// In fr, this message translates to:
  /// **'Dépôts'**
  String get profileDepots;

  /// No description provided for @profileRetraits.
  ///
  /// In fr, this message translates to:
  /// **'Retraits'**
  String get profileRetraits;

  /// No description provided for @profileVenteCartes.
  ///
  /// In fr, this message translates to:
  /// **'Vente de cartes'**
  String get profileVenteCartes;

  /// No description provided for @profileSecuritePinTotp.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get profileSecuritePinTotp;

  /// No description provided for @profileSeDeconnecter.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get profileSeDeconnecter;

  /// No description provided for @profileVoulezVousVraimentVous.
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous vraiment vous déconnecter ?'**
  String get profileVoulezVousVraimentVous;

  /// No description provided for @profileDeconnexion.
  ///
  /// In fr, this message translates to:
  /// **'Déconnexion'**
  String get profileDeconnexion;

  /// No description provided for @changePinPinMisJour.
  ///
  /// In fr, this message translates to:
  /// **'PIN mis à jour'**
  String get changePinPinMisJour;

  /// No description provided for @changePinPinActuel.
  ///
  /// In fr, this message translates to:
  /// **'PIN actuel'**
  String get changePinPinActuel;

  /// No description provided for @changePinConfirmerNouveauPin.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le nouveau PIN'**
  String get changePinConfirmerNouveauPin;

  /// No description provided for @changePinNouveauPinDoitEtre.
  ///
  /// In fr, this message translates to:
  /// **'Le nouveau PIN doit être différent de l’actuel.'**
  String get changePinNouveauPinDoitEtre;

  /// No description provided for @changePinDeuxPinNeCorrespondent.
  ///
  /// In fr, this message translates to:
  /// **'Les deux PIN ne correspondent pas.'**
  String get changePinDeuxPinNeCorrespondent;

  /// No description provided for @changePinEnregistrer.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get changePinEnregistrer;

  /// No description provided for @securitySecurite.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get securitySecurite;

  /// No description provided for @securityPinAuthentification.
  ///
  /// In fr, this message translates to:
  /// **'PIN et vérification en deux étapes'**
  String get securityPinAuthentification;

  /// No description provided for @securityProtegezCompteAgentPin.
  ///
  /// In fr, this message translates to:
  /// **'Protégez votre compte agent : un PIN fort et la vérification en deux étapes réduisent les risques de fraude au comptoir.'**
  String get securityProtegezCompteAgentPin;

  /// No description provided for @securityNecessitePinActuel.
  ///
  /// In fr, this message translates to:
  /// **'Nécessite votre PIN actuel'**
  String get securityNecessitePinActuel;

  /// No description provided for @securityDesactiverDoubleFacteurCode.
  ///
  /// In fr, this message translates to:
  /// **'Un code de votre application est demandé'**
  String get securityDesactiverDoubleFacteurCode;

  /// No description provided for @securityActiverDoubleFacteurAuthentification.
  ///
  /// In fr, this message translates to:
  /// **'Un code à 6 chiffres en plus du PIN à chaque connexion'**
  String get securityActiverDoubleFacteurAuthentification;

  /// No description provided for @securityActive.
  ///
  /// In fr, this message translates to:
  /// **'Activé'**
  String get securityActive;

  /// No description provided for @securityInactif.
  ///
  /// In fr, this message translates to:
  /// **'Inactif'**
  String get securityInactif;

  /// No description provided for @totpEnrollTotpActive.
  ///
  /// In fr, this message translates to:
  /// **'Vérification en deux étapes activée'**
  String get totpEnrollTotpActive;

  /// No description provided for @totpEnrollActivezDoubleFacteurTotp.
  ///
  /// In fr, this message translates to:
  /// **'Activez la vérification en deux étapes avec une application comme Google Authenticator. Un code vous sera demandé à chaque connexion, et vous pourrez réinitialiser votre PIN vous-même.'**
  String get totpEnrollActivezDoubleFacteurTotp;

  /// No description provided for @totpEnrollCommencerActivation.
  ///
  /// In fr, this message translates to:
  /// **'Commencer l’activation'**
  String get totpEnrollCommencerActivation;

  /// No description provided for @totpEnrollCleSecrete.
  ///
  /// In fr, this message translates to:
  /// **'Clé secrète'**
  String get totpEnrollCleSecrete;

  /// No description provided for @totpEnrollScannezQrSaisissezCle.
  ///
  /// In fr, this message translates to:
  /// **'Scannez le QR code ou saisissez la clé dans votre application, puis entrez le code à 6 chiffres.'**
  String get totpEnrollScannezQrSaisissezCle;

  /// No description provided for @totpEnrollCodeVerification.
  ///
  /// In fr, this message translates to:
  /// **'Code de vérification'**
  String get totpEnrollCodeVerification;

  /// No description provided for @totpEnrollActiverTotp.
  ///
  /// In fr, this message translates to:
  /// **'Activer'**
  String get totpEnrollActiverTotp;

  /// No description provided for @totpEnrollCleCopiee.
  ///
  /// In fr, this message translates to:
  /// **'Clé copiée'**
  String get totpEnrollCleCopiee;

  /// No description provided for @totpRevokeTotpRevoque.
  ///
  /// In fr, this message translates to:
  /// **'Vérification en deux étapes désactivée'**
  String get totpRevokeTotpRevoque;

  /// No description provided for @totpRevokeDesactiverTotpReduitSecurite.
  ///
  /// In fr, this message translates to:
  /// **'Désactiver la vérification en deux étapes réduit la sécurité de votre compte et vous empêchera de réinitialiser votre PIN vous-même.'**
  String get totpRevokeDesactiverTotpReduitSecurite;

  /// No description provided for @totpRevokeSaisissezCodeTotpActuel.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez le code affiché dans votre application pour confirmer'**
  String get totpRevokeSaisissezCodeTotpActuel;

  /// No description provided for @commonVenteCarte.
  ///
  /// In fr, this message translates to:
  /// **'Vente de carte'**
  String get commonVenteCarte;

  /// No description provided for @commonRemplacementCarte.
  ///
  /// In fr, this message translates to:
  /// **'Remplacement de carte'**
  String get commonRemplacementCarte;

  /// No description provided for @commonCommission.
  ///
  /// In fr, this message translates to:
  /// **'Commission'**
  String get commonCommission;

  /// No description provided for @commonFrais.
  ///
  /// In fr, this message translates to:
  /// **'Frais'**
  String get commonFrais;

  /// No description provided for @commonPerdue.
  ///
  /// In fr, this message translates to:
  /// **'Perdue'**
  String get commonPerdue;

  /// No description provided for @commonVolee.
  ///
  /// In fr, this message translates to:
  /// **'Volée'**
  String get commonVolee;

  /// No description provided for @commonPasseport.
  ///
  /// In fr, this message translates to:
  /// **'Passeport'**
  String get commonPasseport;

  /// No description provided for @commonAutre.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get commonAutre;

  /// No description provided for @commonRevue.
  ///
  /// In fr, this message translates to:
  /// **'En revue'**
  String get commonRevue;

  /// No description provided for @commonAcceptee.
  ///
  /// In fr, this message translates to:
  /// **'Acceptée'**
  String get commonAcceptee;

  /// No description provided for @commonRejetee.
  ///
  /// In fr, this message translates to:
  /// **'Rejetée'**
  String get commonRejetee;

  /// No description provided for @commonAttente.
  ///
  /// In fr, this message translates to:
  /// **'En attente'**
  String get commonAttente;

  /// No description provided for @commonTransactionIntrouvable.
  ///
  /// In fr, this message translates to:
  /// **'Transaction introuvable.'**
  String get commonTransactionIntrouvable;

  /// No description provided for @commonScannerCarte.
  ///
  /// In fr, this message translates to:
  /// **'Scanner la carte'**
  String get commonScannerCarte;

  /// No description provided for @commonConfirmer.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer'**
  String get commonConfirmer;

  /// No description provided for @commonEffectue.
  ///
  /// In fr, this message translates to:
  /// **'Effectué'**
  String get commonEffectue;

  /// No description provided for @commonAutorise.
  ///
  /// In fr, this message translates to:
  /// **'Autorisé'**
  String get commonAutorise;

  /// No description provided for @commonRefuse.
  ///
  /// In fr, this message translates to:
  /// **'Refusé'**
  String get commonRefuse;

  /// No description provided for @commonAnnule.
  ///
  /// In fr, this message translates to:
  /// **'Annulé'**
  String get commonAnnule;

  /// No description provided for @commonLipa.
  ///
  /// In fr, this message translates to:
  /// **'Lipa'**
  String get commonLipa;

  /// No description provided for @commonStatut2.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get commonStatut2;

  /// No description provided for @commonType.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get commonType;

  /// No description provided for @commonToutePeriode.
  ///
  /// In fr, this message translates to:
  /// **'Toute la période'**
  String get commonToutePeriode;

  /// No description provided for @commonMontant.
  ///
  /// In fr, this message translates to:
  /// **'Montant'**
  String get commonMontant;

  /// No description provided for @commonActivite.
  ///
  /// In fr, this message translates to:
  /// **'Activité'**
  String get commonActivite;

  /// No description provided for @commonImpossibleChargerActivite.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger l’activité.'**
  String get commonImpossibleChargerActivite;

  /// No description provided for @commonReleve.
  ///
  /// In fr, this message translates to:
  /// **'Relevé'**
  String get commonReleve;

  /// No description provided for @commonCopie.
  ///
  /// In fr, this message translates to:
  /// **'{label} copié'**
  String commonCopie(Object label);

  /// No description provided for @commonDepotClient.
  ///
  /// In fr, this message translates to:
  /// **'Dépôt client'**
  String get commonDepotClient;

  /// No description provided for @commonRetraitMarchand.
  ///
  /// In fr, this message translates to:
  /// **'Retrait marchand'**
  String get commonRetraitMarchand;

  /// No description provided for @commonOperer.
  ///
  /// In fr, this message translates to:
  /// **'Opérer'**
  String get commonOperer;

  /// No description provided for @commonCartes.
  ///
  /// In fr, this message translates to:
  /// **'Cartes'**
  String get commonCartes;

  /// No description provided for @commonProfil.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get commonProfil;

  /// No description provided for @commonNumeroTelephone.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de téléphone'**
  String get commonNumeroTelephone;

  /// No description provided for @commonNouveauPin.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau PIN'**
  String get commonNouveauPin;

  /// No description provided for @commonConfirmerPin.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le PIN'**
  String get commonConfirmerPin;

  /// No description provided for @commonRetourConnexion.
  ///
  /// In fr, this message translates to:
  /// **'← Retour à la connexion'**
  String get commonRetourConnexion;

  /// No description provided for @commonReponseInattendueServeur.
  ///
  /// In fr, this message translates to:
  /// **'Réponse inattendue du serveur.'**
  String get commonReponseInattendueServeur;

  /// No description provided for @commonErreurSurvenue.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue.'**
  String get commonErreurSurvenue;

  /// No description provided for @commonStockIndisponible.
  ///
  /// In fr, this message translates to:
  /// **'Stock indisponible.'**
  String get commonStockIndisponible;

  /// No description provided for @commonVendreCarte.
  ///
  /// In fr, this message translates to:
  /// **'Vendre une carte'**
  String get commonVendreCarte;

  /// No description provided for @commonAnnuler.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get commonAnnuler;

  /// No description provided for @commonRechercherCarte.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une carte'**
  String get commonRechercherCarte;

  /// No description provided for @commonRemplacerCarte.
  ///
  /// In fr, this message translates to:
  /// **'Remplacer la carte'**
  String get commonRemplacerCarte;

  /// No description provided for @commonRef.
  ///
  /// In fr, this message translates to:
  /// **'Réf.'**
  String get commonRef;

  /// No description provided for @commonRechercherClient.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher le client'**
  String get commonRechercherClient;

  /// No description provided for @commonNumeroClient.
  ///
  /// In fr, this message translates to:
  /// **'Numéro du client'**
  String get commonNumeroClient;

  /// No description provided for @commonDepot.
  ///
  /// In fr, this message translates to:
  /// **'Dépôt'**
  String get commonDepot;

  /// No description provided for @commonRetrait.
  ///
  /// In fr, this message translates to:
  /// **'Retrait'**
  String get commonRetrait;

  /// No description provided for @commonCommissions.
  ///
  /// In fr, this message translates to:
  /// **'Commissions'**
  String get commonCommissions;

  /// No description provided for @commonEnrolerClient.
  ///
  /// In fr, this message translates to:
  /// **'Enrôler un client'**
  String get commonEnrolerClient;

  /// No description provided for @commonKycClient.
  ///
  /// In fr, this message translates to:
  /// **'KYC client'**
  String get commonKycClient;

  /// No description provided for @commonProfilIndisponible.
  ///
  /// In fr, this message translates to:
  /// **'Profil indisponible.'**
  String get commonProfilIndisponible;

  /// No description provided for @commonPlafonds.
  ///
  /// In fr, this message translates to:
  /// **'Plafonds'**
  String get commonPlafonds;

  /// No description provided for @commonChangerMonPin.
  ///
  /// In fr, this message translates to:
  /// **'Changer mon PIN'**
  String get commonChangerMonPin;

  /// No description provided for @commonDesactiverDeuxEtapes.
  ///
  /// In fr, this message translates to:
  /// **'Désactiver la vérification en deux étapes'**
  String get commonDesactiverDeuxEtapes;

  /// No description provided for @commonActiverDeuxEtapes.
  ///
  /// In fr, this message translates to:
  /// **'Activer la vérification en deux étapes'**
  String get commonActiverDeuxEtapes;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
