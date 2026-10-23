// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get labelVerification => 'En vérification';

  @override
  String get labelActif => 'Actif';

  @override
  String get labelSuspendu => 'Suspendu';

  @override
  String get labelGele => 'Gelé';

  @override
  String get labelCloture => 'Clôturé';

  @override
  String get labelAucun => 'Aucun';

  @override
  String get labelBasique => 'Basique';

  @override
  String get labelVerifie => 'Vérifié';

  @override
  String get labelRenforce => 'Renforcé';

  @override
  String get labelPaiementMarchand => 'Paiement marchand';

  @override
  String get labelApprovisionnementFloat => 'Approvisionnement du float';

  @override
  String get labelRetraitFloat => 'Retrait du float';

  @override
  String get labelAnnulation => 'Annulation';

  @override
  String get labelTransfertMarchand => 'Virement entre marchands';

  @override
  String get labelPaiementFacture => 'Paiement de facture';

  @override
  String get labelReglementFacturier => 'Règlement des facturiers';

  @override
  String get labelRetraitPlateforme => 'Retrait des revenus';

  @override
  String get labelVersementCommission => 'Versement de commission';

  @override
  String get labelTransaction => 'Transaction';

  @override
  String get labelStandard => 'Standard';

  @override
  String get labelPremium => 'Premium';

  @override
  String get labelEntreprise => 'Entreprise';

  @override
  String get labelEmise => 'Émise';

  @override
  String get labelActive => 'Active';

  @override
  String get labelBloquee => 'Bloquée';

  @override
  String get labelExpiree => 'Expirée';

  @override
  String get labelCloturee => 'Clôturée';

  @override
  String get labelEntrepot => 'En entrepôt';

  @override
  String get labelAttribuee => 'Attribuée';

  @override
  String get labelVendue => 'Vendue';

  @override
  String get labelRetournee => 'Retournée';

  @override
  String get labelAbimee => 'Abîmée';

  @override
  String get labelCarteNationaleIdentite => 'Carte nationale d’identité';

  @override
  String get labelJustificatifDomicile => 'Justificatif de domicile';

  @override
  String get labelLicenceCommerciale => 'Licence commerciale';

  @override
  String get labelDocument => 'Document';

  @override
  String get labelImmediat => 'Immédiat';

  @override
  String get labelQuotidien => 'Quotidien';

  @override
  String get labelHebdomadaire => 'Hebdomadaire';

  @override
  String get labelPayee => 'Payée';

  @override
  String get labelEchec => 'Échec';

  @override
  String get labelAnnulee => 'Annulée';

  @override
  String get appLipaAgent => 'Lipa Agent';

  @override
  String get errorNumeroPinIncorrect => 'Numéro ou PIN incorrect.';

  @override
  String get errorPinIncorrectReessayez => 'PIN incorrect. Réessayez.';

  @override
  String get errorPinBloqueReessayezDans =>
      'PIN bloqué. Réessayez dans 15 minutes.';

  @override
  String get errorPinDoitComporter4 => 'Le PIN doit comporter 4 à 8 chiffres.';

  @override
  String get errorPinDejaDefiniCompte =>
      'Un PIN est déjà défini pour ce compte.';

  @override
  String get errorAucunPinNDefini => 'Aucun PIN n’est défini pour ce compte.';

  @override
  String get errorActivezTotpContactezBack =>
      'Activez la vérification en deux étapes ou contactez le back-office pour réinitialiser votre PIN.';

  @override
  String get errorLienExpireRecommencezConnexion =>
      'Lien expiré. Recommencez la connexion.';

  @override
  String get errorCodeVerificationInvalide => 'Code de vérification invalide.';

  @override
  String get errorSessionExpireReconnectezVous =>
      'Votre session a expiré. Reconnectez-vous.';

  @override
  String get errorTropTentativesReessayezDans =>
      'Trop de tentatives. Réessayez dans un instant.';

  @override
  String get errorCompteAgentCoursVerification =>
      'Votre compte agent est en cours de vérification.';

  @override
  String get errorCompteIndisponibleContactezBack =>
      'Compte indisponible. Contactez le back-office.';

  @override
  String get errorNiveauVerificationKycInsuffisant =>
      'Niveau de vérification (KYC) insuffisant pour cette opération.';

  @override
  String get errorSoldeInsuffisantOperation =>
      'Solde insuffisant pour cette opération.';

  @override
  String get errorMontantInferieurMinimumAutorise =>
      'Montant inférieur au minimum autorisé.';

  @override
  String get errorMontantSuperieurMaximumAutorise =>
      'Montant supérieur au maximum autorisé.';

  @override
  String get errorMontantDoitEtreSuperieur =>
      'Le montant doit être supérieur à zéro.';

  @override
  String get errorPlafondJournalierAtteintConsultez =>
      'Plafond journalier atteint. Consultez vos plafonds.';

  @override
  String get errorPlafondHebdomadaireAtteintConsultez =>
      'Plafond hebdomadaire atteint. Consultez vos plafonds.';

  @override
  String get errorPlafondMensuelAtteintConsultez =>
      'Plafond mensuel atteint. Consultez vos plafonds.';

  @override
  String get errorNombreMaximalOperationsAtteint =>
      'Nombre maximal d’opérations atteint. Consultez vos plafonds.';

  @override
  String get errorServiceTemporairementIndisponibleReessayez =>
      'Service temporairement indisponible. Réessayez plus tard.';

  @override
  String get errorMontantSoumisApprobationBack =>
      'Montant soumis à approbation du back-office.';

  @override
  String get errorVousNEtesPas =>
      'Vous n’êtes pas autorisé à faire des dépôts.';

  @override
  String get errorRetraitMarchandNonAutorise =>
      'Retrait marchand non autorisé.';

  @override
  String get errorVousNEtesPas2 =>
      'Vous n’êtes pas autorisé à vendre ou remplacer des cartes.';

  @override
  String get errorOperationDejaCoursTraitement =>
      'Opération déjà en cours de traitement. Réessayez dans un instant.';

  @override
  String get errorDonneesOntChangeEntre =>
      'Les données ont changé entre-temps. Réessayez.';

  @override
  String get errorNumeroNeCorrespondAucun =>
      'Ce numéro ne correspond à aucun client Lipa.';

  @override
  String get errorNumeroNeCorrespondAucun2 =>
      'Ce numéro ne correspond à aucun marchand Lipa.';

  @override
  String get errorCarteIntrouvableCetUid =>
      'Aucune carte ne correspond à cet identifiant.';

  @override
  String get errorIntrouvable => 'Introuvable.';

  @override
  String get errorNumeroTelephoneDejaUtilise =>
      'Ce numéro de téléphone est déjà utilisé.';

  @override
  String get errorNumeroPieceIdentiteDeja =>
      'Ce numéro de pièce d’identité est déjà utilisé.';

  @override
  String get errorStockCartesIntrouvable => 'Stock de cartes introuvable.';

  @override
  String get errorCarteNPasDisponible =>
      'Cette carte n’est pas disponible à la vente.';

  @override
  String get errorCarteNeVousPas => 'Cette carte ne vous est pas attribuée.';

  @override
  String get errorCarteRemplacerNPas =>
      'La carte à remplacer n’est pas active.';

  @override
  String get errorOperationNPasPossible =>
      'Cette opération n’est pas possible sur cette carte.';

  @override
  String get errorDonneesInvalidesVerifiezChamps =>
      'Données invalides. Vérifiez les champs.';

  @override
  String get errorConnexionImpossibleVerifiezReseau =>
      'Connexion impossible. Vérifiez votre réseau.';

  @override
  String get errorErreurSurvenueReessayez =>
      'Une erreur est survenue. Réessayez.';

  @override
  String errorErreurSurvenueReessayezRef(Object ref) {
    return 'Une erreur est survenue. Réessayez. (Réf. $ref)';
  }

  @override
  String get scannerApprochezCarteTelephone =>
      'Approchez la carte du téléphone';

  @override
  String get scannerCarteNonReconnueReessayez =>
      'Carte non reconnue. Réessayez ou saisissez son identifiant.';

  @override
  String get scannerLectureNfcInterrompueReessayez =>
      'Lecture NFC interrompue. Réessayez.';

  @override
  String get scannerLecteurNfcIndisponible =>
      'Le lecteur NFC est indisponible.';

  @override
  String get scannerApprochezCarteDosTelephone =>
      'Approchez la carte du dos du téléphone pour la lire.';

  @override
  String get scannerSaisirUidManuellement => 'Saisir l’identifiant de la carte';

  @override
  String get scannerSaisirUid => 'Identifiant de la carte';

  @override
  String get scannerSaisissezIdentifiantUidCarte =>
      'Saisissez l’identifiant (UID) de la carte : 14 caractères, chiffres 0–9 et lettres A–F.';

  @override
  String get scannerUidInvalide14Caracteres =>
      'Identifiant invalide : 14 caractères attendus (0–9, A–F).';

  @override
  String get formattersInstant => 'à l’instant';

  @override
  String formattersIlYMin(Object min) {
    return 'il y a $min min';
  }

  @override
  String formattersIlYH(Object h) {
    return 'il y a $h h';
  }

  @override
  String formattersIlYJ(Object days) {
    return 'il y a $days j';
  }

  @override
  String transactionReceiptOperation(Object kind) {
    return 'Opération : $kind';
  }

  @override
  String transactionReceiptMontantKmf(Object sign, Object amount) {
    return 'Montant : $sign$amount KMF';
  }

  @override
  String transactionReceiptStatut(Object state) {
    return 'Statut : $state';
  }

  @override
  String transactionReceiptDate(Object date) {
    return 'Date : $date';
  }

  @override
  String transactionReceiptFraisKmf(Object amount) {
    return 'Frais : $amount KMF';
  }

  @override
  String transactionReceiptCommissionKmf(Object amount) {
    return 'Commission : $amount KMF';
  }

  @override
  String transactionReceiptMontantNetKmf(Object amount) {
    return 'Montant net : $amount KMF';
  }

  @override
  String transactionReceiptReference(Object id) {
    return 'Référence : $id';
  }

  @override
  String get transactionReceiptRecuTransaction => 'Reçu de transaction';

  @override
  String get transactionReceiptDate2 => 'Date';

  @override
  String get transactionReceiptMontantNet => 'Montant net';

  @override
  String get transactionReceiptReference2 => 'Référence';

  @override
  String get transactionReceiptRecuGenereApplicationLipa =>
      'Ce reçu est généré par l’application Lipa à titre informatif.';

  @override
  String get transactionReceiptDescription => 'Description';

  @override
  String get transactionReceiptSolde => 'Solde';

  @override
  String get transactionReceiptReleveLipa => 'Relevé Lipa';

  @override
  String transactionReceiptPage(Object pageNumber, Object pagesCount) {
    return 'Page $pageNumber/$pagesCount';
  }

  @override
  String get transactionReceiptReleveCompte => 'Relevé du compte';

  @override
  String transactionReceiptPeriode(Object period) {
    return 'Période : $period';
  }

  @override
  String get transactionReceiptAucuneEcriturePeriode =>
      'Aucun mouvement sur cette période.';

  @override
  String get validatorsNumeroDoitCommencer3 =>
      'Le numéro doit commencer par 3 ou 4.';

  @override
  String get validatorsNumeroDoitContenir7 =>
      'Le numéro doit contenir 7 chiffres.';

  @override
  String get commonReessayer => 'Réessayer';

  @override
  String get lipaBrandAgent => 'Agent';

  @override
  String get resultOperationDejaTraiteeResultat =>
      'Cette opération avait déjà été enregistrée : voici son résultat.';

  @override
  String get resultTermine => 'Terminé';

  @override
  String get activityTransactions => 'Vos transactions';

  @override
  String get activityToutes => 'Toutes';

  @override
  String get activityEntrees => 'Entrées';

  @override
  String get activitySorties => 'Sorties';

  @override
  String get activityAucuneOperation => 'Aucune opération';

  @override
  String get activityDepotsRetraitsVentesCartes =>
      'Vos dépôts, retraits et ventes de cartes apparaîtront ici.';

  @override
  String get statementEcrituresCompte => 'Mouvements du compte';

  @override
  String get statementReleveIndisponible => 'Relevé indisponible.';

  @override
  String get statementReleveVide => 'Relevé vide';

  @override
  String get statementAucuneEcriturePeriode =>
      'Aucun mouvement sur cette période.';

  @override
  String get statementImpossibleGenererRelevePdf =>
      'Impossible de générer le relevé PDF.';

  @override
  String statementSolde(Object amount) {
    return 'Solde $amount';
  }

  @override
  String get transactionDetailDetailOperation => 'Détail de l’opération';

  @override
  String get transactionDetailEffectue => 'Effectué le';

  @override
  String get transactionDetailRefuse => 'Refusé le';

  @override
  String get transactionDetailCree => 'Créé le';

  @override
  String get transactionDetailNetDestinataire => 'Montant reçu';

  @override
  String get transactionDetailMotifRefus => 'Motif du refus';

  @override
  String get transactionDetailRefTransaction => 'Réf. transaction';

  @override
  String get transactionDetailCorrelation => 'Référence support';

  @override
  String get transactionDetailRecuPdf => 'Reçu PDF';

  @override
  String get transactionDetailPartager => 'Partager';

  @override
  String get transactionDetailImpossibleGenererRecuPdf =>
      'Impossible de générer le reçu PDF.';

  @override
  String get transactionDetailRecuLipa => 'Reçu Lipa';

  @override
  String get agentShellAccueil => 'Accueil';

  @override
  String get authNoticesVousAvezEteDeconnecte => 'Vous avez été déconnecté';

  @override
  String get authNoticesReconnectezVousContinuerOperations =>
      'Reconnectez-vous pour continuer vos opérations agent Lipa.';

  @override
  String get authNoticesSeReconnecter => 'Se reconnecter';

  @override
  String get authNoticesSaisiePinBloquee => 'Saisie du PIN bloquée';

  @override
  String get authNoticesPinIncorrectSaisi3 =>
      'PIN incorrect saisi 3 fois. Réessayez dans 15 minutes.';

  @override
  String get authNoticesReinitialiserMonPin => 'Réinitialiser mon PIN';

  @override
  String get authEspaceAgent => 'Espace agent';

  @override
  String get authConnectezVousGererOperations =>
      'Connectez-vous pour gérer vos opérations cash et l’enrôlement client.';

  @override
  String get authVerifiezIdentite => 'Vérifiez votre identité';

  @override
  String get authSaisissezCode6Chiffres =>
      'Saisissez le code à 6 chiffres de votre application d’authentification.';

  @override
  String get authDefinirPin => 'Définir votre PIN';

  @override
  String get authChoisissezPinProtegeraCompte =>
      'Choisissez le PIN qui protégera votre compte agent et vos opérations.';

  @override
  String get authPinOublie => 'PIN oublié';

  @override
  String get authReinitialisezPinAvecCode =>
      'Réinitialisez votre PIN avec le code de votre application d’authentification.';

  @override
  String get authSessionExpiree => 'Session expirée';

  @override
  String get authVousAvezEteDeconnecte =>
      'Vous avez été déconnecté afin de protéger votre compte agent.';

  @override
  String get authPinBloque => 'PIN bloqué';

  @override
  String get authTropTentativesIncorrectesReessayez =>
      'Trop de tentatives incorrectes. Réessayez dans 15 minutes.';

  @override
  String get forgotPinReinitialisationPossibleUniquementSi =>
      'Réinitialisation possible uniquement si la vérification en deux étapes est activée. Sinon, contactez le back-office Lipa.';

  @override
  String get forgotPinCodeAuthentificationTotp =>
      'Code de l’application d’authentification';

  @override
  String get forgotPinReinitialiserPin => 'Réinitialiser le PIN';

  @override
  String get loginPinReinitialiseConnectezVous =>
      'PIN réinitialisé. Connectez-vous avec votre nouveau PIN.';

  @override
  String get login48Chiffres => '4 à 8 chiffres';

  @override
  String get loginSaisissezPin => 'Saisissez votre PIN';

  @override
  String get loginSeConnecter => 'Se connecter';

  @override
  String get loginPinOublie => 'PIN oublié ?';

  @override
  String get loginPinPersonnel => 'Votre PIN est personnel. ';

  @override
  String get loginNeCommuniquezJamaisPin =>
      'Ne le communiquez jamais, même au back-office Lipa.';

  @override
  String get mfaVerifierContinuer => 'Vérifier et continuer';

  @override
  String get pinSetupConfigurationUniqueChoisissezPin =>
      'Configuration unique. Choisissez un PIN de 4 à 8 chiffres.';

  @override
  String get pinSetupEnregistrerPin => 'Enregistrer le PIN';

  @override
  String get cardsStockAttribue => 'Stock attribué';

  @override
  String get cardsCartesDisponibles => 'Cartes disponibles';

  @override
  String get cardsStockVide => 'Stock vide';

  @override
  String get cardsAucuneCarteAttribueeContactez =>
      'Aucune carte attribuée. Contactez le back-office pour un réapprovisionnement.';

  @override
  String cardsAttribuee(Object date) {
    return 'Attribuée le $date';
  }

  @override
  String cardsLot(Object batchRef) {
    return 'Lot $batchRef';
  }

  @override
  String get cardLookupDeclarerVolee => 'Déclarer volée';

  @override
  String get cardLookupDeclarerPerdue => 'Déclarer perdue';

  @override
  String get cardLookupConfirmerCarteVoleeElle =>
      'Confirmer que cette carte est volée ? Elle sera bloquée immédiatement.';

  @override
  String get cardLookupConfirmerCartePerdueElle =>
      'Confirmer que cette carte est perdue ? Elle sera bloquée immédiatement.';

  @override
  String get cardLookupCarteDeclareeVolee => 'Carte déclarée volée';

  @override
  String get cardLookupCarteDeclareePerdue => 'Carte déclarée perdue';

  @override
  String get cardLookupUidNfc => 'Carte perdue, volée ou à remplacer';

  @override
  String get cardLookupScannezCarteClientSaisissez =>
      'Scannez la carte du client (ou saisissez son identifiant) pour la retrouver, puis déclarez-la perdue ou volée, ou remplacez-la.';

  @override
  String get cardLookupScannerAutreCarte => 'Scanner une autre carte';

  @override
  String get cardLookupCarteNPasEncore =>
      'Cette carte n’est pas encore liée à un client. Perte, vol et remplacement ne concernent que les cartes vendues.';

  @override
  String get cardLookupCarte => 'Carte';

  @override
  String get cardLookupUidNfc2 => 'Identifiant (UID)';

  @override
  String get cardLookupTitulaire => 'Titulaire';

  @override
  String get cardLookupTelephone => 'Téléphone';

  @override
  String get cardReplaceRemplacement => 'Remplacement';

  @override
  String get cardReplaceCarteRemplacee => 'Carte remplacée';

  @override
  String get cardReplaceNouvelleCarteActiveeClient =>
      'Nouvelle carte activée pour le client.';

  @override
  String get cardReplaceFraisFactures => 'Frais facturés';

  @override
  String get cardReplaceNouvelleCarte => 'Nouvelle carte';

  @override
  String get cardReplaceAncienneCarte => 'Ancienne carte';

  @override
  String get cardReplaceChoisissezCarteStockAttribue =>
      'Choisissez une carte de votre stock attribué pour remplacer la carte du client.';

  @override
  String get cardReplaceCarteRemplacement => 'Carte de remplacement';

  @override
  String get cardReplaceAucuneCarteDisponibleDans =>
      'Aucune carte disponible dans votre stock attribué.';

  @override
  String get cardReplaceFraisRemplacement => 'Frais de remplacement';

  @override
  String cardReplaceRemplacer(Object amount) {
    return 'Remplacer pour $amount';
  }

  @override
  String get cardSaleCarteVendue => 'Carte vendue';

  @override
  String get cardSaleClient => 'le client';

  @override
  String cardSaleCarteActivee(Object client) {
    return 'Carte activée pour $client.';
  }

  @override
  String get cardSalePrixFacture => 'Prix facturé';

  @override
  String get cardSaleDepuisStock => 'Depuis votre stock';

  @override
  String get cardSaleClient2 => 'Client';

  @override
  String get cardSaleCarteNfc => 'Carte';

  @override
  String get cardSalePrixCarte => 'Prix de la carte';

  @override
  String cardSaleVendre(Object amount) {
    return 'Vendre pour $amount';
  }

  @override
  String get cardSaleVendreCarte => 'Vendre la carte';

  @override
  String get cardSaleCarteSelectionnee => 'Carte sélectionnée';

  @override
  String get cardSaleChanger => 'Changer';

  @override
  String get cashInSaisissezNumeroClientConfirmer =>
      'Saisissez le numéro du client pour confirmer son identité avant le dépôt.';

  @override
  String get cashInChangerClient => 'Changer de client';

  @override
  String get cashInMontantDeposer => 'Montant à déposer';

  @override
  String cashInDeposer(Object amount) {
    return 'Déposer $amount';
  }

  @override
  String get cashInDeposer2 => 'Déposer';

  @override
  String get cashInFloatSeraDebiteMontant =>
      'Votre float sera débité du montant déposé.';

  @override
  String get cashInDepotEffectue => 'Dépôt effectué';

  @override
  String cashInCredites(Object amount, Object customerName) {
    return '$amount crédités à $customerName.';
  }

  @override
  String get cashInCrediteClient => 'Crédité au client';

  @override
  String get cashOutPinMarchand => 'PIN du marchand';

  @override
  String cashOutDemandezMarchandSaisirSon(Object amount) {
    return 'Demandez au marchand de saisir son PIN pour autoriser le retrait de $amount.';
  }

  @override
  String get cashOutSaisissezNumeroMarchandConfirmer =>
      'Saisissez le numéro du marchand pour confirmer le bénéficiaire du retrait.';

  @override
  String get cashOutNumeroMarchand => 'Numéro du marchand';

  @override
  String get cashOutRechercherMarchand => 'Rechercher le marchand';

  @override
  String get cashOutRetraitBloque => 'Retrait bloqué';

  @override
  String get cashOutMarchandNPasAutorise =>
      'Ce marchand n’est pas autorisé à effectuer des retraits.';

  @override
  String get cashOutChangerMarchand => 'Changer de marchand';

  @override
  String get cashOutMontantRetirer => 'Montant à retirer';

  @override
  String cashOutMontantSuperieurSeuilConfirmez(Object amount) {
    return 'Montant supérieur au seuil de $amount. Confirmez pour poursuivre.';
  }

  @override
  String get cashOutConfirmerRetrait => 'Confirmer le retrait';

  @override
  String cashOutRetirer(Object amount) {
    return 'Retirer $amount';
  }

  @override
  String get cashOutRetirer2 => 'Retirer';

  @override
  String get cashOutMarchandDebiteFloatCredite =>
      'Le marchand est débité, votre float est crédité.';

  @override
  String get cashOutApprobationRequise => 'Approbation requise';

  @override
  String cashOutRetraitDepasseSeuilEte(Object amount) {
    return 'Ce retrait de $amount dépasse le seuil et a été transmis au back-office pour approbation. Aucun mouvement n’a encore eu lieu.';
  }

  @override
  String get cashOutSeuil => 'Seuil';

  @override
  String get cashOutRefApprobation => 'Réf. approbation';

  @override
  String get cashOutRetraitEffectue => 'Retrait effectué';

  @override
  String cashOutRetires(Object amount, Object merchantName) {
    return '$amount retirés pour $merchantName.';
  }

  @override
  String get commissionsVersements => 'Vos versements';

  @override
  String get commissionsCommissionsIndisponibles =>
      'Commissions indisponibles.';

  @override
  String get commissionsAucuneCommission => 'Aucune commission';

  @override
  String get commissionsCommissionsDepotsRetraitsVentes =>
      'Vos commissions sur dépôts, retraits et ventes apparaîtront ici.';

  @override
  String get commissionsTotalVerse => 'Total versé';

  @override
  String commissionsSur(Object amount) {
    return 'Sur $amount';
  }

  @override
  String get enrollDateNaissance => 'Date de naissance';

  @override
  String get enrollNouveauCompteKyc => 'Compte et pièces KYC';

  @override
  String get enrollNomComplet => 'Nom complet';

  @override
  String get enrollPrenomNom => 'Prénom et nom';

  @override
  String get enrollTypePiece => 'Type de pièce';

  @override
  String get enrollNumeroPiece => 'Numéro de pièce';

  @override
  String get enrollNPieceIdentite => 'N° de la pièce d’identité';

  @override
  String get enrollAdresseFacultatif => 'Adresse (facultatif)';

  @override
  String get enrollIle => 'Île';

  @override
  String get enrollVille => 'Ville';

  @override
  String get enrollQuartier => 'Quartier';

  @override
  String get enrollCreerCompteClient => 'Créer le compte client';

  @override
  String get enrollSelectionnerDate => 'Sélectionner une date';

  @override
  String get enrollCarteNationale => 'Carte nationale';

  @override
  String get enrollEnrolement => 'Enrôlement';

  @override
  String get enrollClientEnrole => 'Client enrôlé';

  @override
  String enrollEteCreeAvecCompte(Object name) {
    return '$name a été créé avec un compte actif. Ajoutez ses pièces KYC maintenant.';
  }

  @override
  String get enrollAjouterDocumentsKyc => 'Ajouter des documents KYC';

  @override
  String get enrollReferenceClient => 'Référence client';

  @override
  String get enrollIdClient => 'ID client';

  @override
  String get enrollCompte => 'Compte';

  @override
  String get kycCustomerCompleterDossierClient =>
      'Compléter le dossier d’un client';

  @override
  String get kycCustomerGererDocumentsKyc => 'Gérer les documents KYC';

  @override
  String get kycCustomerDocumentsEnvoyesSontExamines =>
      'Les documents envoyés sont examinés par le back-office, qui décide du rehaussement du niveau KYC.';

  @override
  String get kycCustomerNiveauVerifiePieceIdentite =>
      'Pour le niveau Vérifié : pièce d’identité (CNI ou passeport) et justificatif de domicile.';

  @override
  String get kycCustomerNiveauRenforceJustificatifsComplementaires =>
      'Pour le niveau Renforcé : justificatifs complémentaires demandés par le back-office.';

  @override
  String get kycCustomerNiveauKycActuel => 'Niveau KYC actuel';

  @override
  String get kycCustomerNiveauMaximalAtteint => 'Niveau maximal atteint.';

  @override
  String get kycDocumentsImageTropVolumineuse10 =>
      'Image trop volumineuse (10 Mo maximum).';

  @override
  String get kycDocumentsDocumentEnvoye => 'Document envoyé';

  @override
  String get kycDocumentsPrendrePhoto => 'Prendre une photo';

  @override
  String get kycDocumentsChoisirDansGalerie => 'Choisir dans la galerie';

  @override
  String get kycDocumentsDocumentsKyc => 'Documents KYC';

  @override
  String get kycDocumentsTypeDocumentEnvoyer => 'Type de document à envoyer';

  @override
  String get kycDocumentsAjouterDocument => 'Ajouter un document';

  @override
  String get kycDocumentsImage10MoMaximum => 'Image, 10 Mo maximum.';

  @override
  String get kycDocumentsDocumentsDejaEnvoyes => 'Documents déjà envoyés';

  @override
  String get kycDocumentsAucunDocument => 'Aucun document';

  @override
  String get kycDocumentsAjoutezPieceIdentiteClient =>
      'Ajoutez la pièce d’identité du client et tout justificatif requis.';

  @override
  String kycDocumentsVerifiezDocument(Object typeLabel) {
    return 'Vérifiez le document — $typeLabel';
  }

  @override
  String get kycDocumentsConfirmerEnvoi => 'Confirmer l’envoi';

  @override
  String get kycDocumentsReprendre => 'Reprendre';

  @override
  String get floatCardFloatDisponible => 'Float disponible';

  @override
  String floatCardKmfReservesCompte(Object amount) {
    return '$amount KMF réservés · Compte ';
  }

  @override
  String floatCardFloatSousSeuilAlerte(Object amount) {
    return 'Float sous le seuil d’alerte ($amount). Pensez à réapprovisionner.';
  }

  @override
  String get homeAgentLipa => 'Lipa Agent';

  @override
  String get homeAujourdHui => 'Aujourd\'hui';

  @override
  String get homeOperationsRapides => 'Opérations rapides';

  @override
  String get homeActiviteRecente => 'Activité récente';

  @override
  String get homeAucuneOperationMoment => 'Aucune opération pour le moment.';

  @override
  String get summaryGridResumeIndisponible => 'Résumé indisponible.';

  @override
  String get summaryGridVolume => 'Volume';

  @override
  String get summaryGridOperations => 'Opérations';

  @override
  String get notificationsNotifications => 'Notifications';

  @override
  String get notificationsToutLire => 'Tout lire';

  @override
  String get notificationsNotificationsIndisponibles =>
      'Notifications indisponibles.';

  @override
  String get notificationsAucuneNotification => 'Aucune notification';

  @override
  String get notificationsAlertesApparaitrontIciQu =>
      'Vos alertes apparaîtront ici dès qu’elles seront disponibles.';

  @override
  String get notificationsDepotCredite => 'Dépôt crédité';

  @override
  String get notificationsRetraitMarchandEffectue =>
      'Retrait marchand effectué';

  @override
  String get notificationsNotification => 'Notification';

  @override
  String get operationsHubEspeces => 'Espèces';

  @override
  String get operationsHubCrediterCompteClient =>
      'Créditer le compte d’un client';

  @override
  String get quickOpsCrediterClient => 'Créditer un client';

  @override
  String get quickOpsRemettreEspeces => 'Remettre des espèces';

  @override
  String get quickOpsCompteKyc => 'Compte et KYC';

  @override
  String get operationsHubDecaisserMarchand =>
      'Remettre des espèces à un marchand';

  @override
  String get operationsHubOperationsEspecesNeSont =>
      'Les opérations espèces ne sont pas activées sur votre compte.';

  @override
  String get operationsHubClients => 'Clients';

  @override
  String get operationsHubCreerCompteKyc =>
      'Créer son compte et ajouter ses pièces KYC';

  @override
  String get operationsHubCompleterDossierClientExistant =>
      'Compléter le dossier d’un client existant';

  @override
  String get operationsHubUidNfcPerteVol =>
      'Carte perdue, volée ou à remplacer';

  @override
  String get operationsHubDepuisStockAttribue => 'Depuis votre stock attribué';

  @override
  String get limitsLimitesTransaction => 'Limites de transaction';

  @override
  String get limitsPlafondsIndisponibles => 'Plafonds indisponibles.';

  @override
  String get limitsAucunPlafondConfigure => 'Aucun plafond configuré';

  @override
  String get limitsAucunProfilLimitesN =>
      'Aucun profil de limites n’est attribué à votre compte.';

  @override
  String limitsKycRequis(Object requiredKycLevel) {
    return 'KYC requis : $requiredKycLevel';
  }

  @override
  String get limitsTransaction => 'Par transaction';

  @override
  String get limitsMinimum => 'Minimum';

  @override
  String get limitsMaximum => 'Maximum';

  @override
  String get limitsCumuls => 'Cumuls';

  @override
  String get limitsPlafondJournalier => 'Plafond journalier';

  @override
  String get limitsPlafondHebdomadaire => 'Plafond hebdomadaire';

  @override
  String get limitsPlafondMensuel => 'Plafond mensuel';

  @override
  String get limitsTransactionsJour => 'Transactions / jour';

  @override
  String get limitsTransactionsMois => 'Transactions / mois';

  @override
  String get limitsNonDefini => 'Non défini';

  @override
  String get profileReferenceAgent => 'Référence agent';

  @override
  String get profileZone => 'Zone';

  @override
  String get profileNiveauKyc => 'Niveau KYC';

  @override
  String get profileContrat => 'Contrat';

  @override
  String get profileSeuilAlerteFloat => 'Seuil d’alerte float';

  @override
  String get profileAutorisations => 'Autorisations';

  @override
  String get profileDepots => 'Dépôts';

  @override
  String get profileRetraits => 'Retraits';

  @override
  String get profileVenteCartes => 'Vente de cartes';

  @override
  String get profileSecuritePinTotp => 'Sécurité';

  @override
  String get profileSeDeconnecter => 'Se déconnecter';

  @override
  String get profileVoulezVousVraimentVous =>
      'Voulez-vous vraiment vous déconnecter ?';

  @override
  String get profileDeconnexion => 'Déconnexion';

  @override
  String get changePinPinMisJour => 'PIN mis à jour';

  @override
  String get changePinPinActuel => 'PIN actuel';

  @override
  String get changePinConfirmerNouveauPin => 'Confirmer le nouveau PIN';

  @override
  String get changePinNouveauPinDoitEtre =>
      'Le nouveau PIN doit être différent de l’actuel.';

  @override
  String get changePinDeuxPinNeCorrespondent =>
      'Les deux PIN ne correspondent pas.';

  @override
  String get changePinEnregistrer => 'Enregistrer';

  @override
  String get securitySecurite => 'Sécurité';

  @override
  String get securityPinAuthentification =>
      'PIN et vérification en deux étapes';

  @override
  String get securityProtegezCompteAgentPin =>
      'Protégez votre compte agent : un PIN fort et la vérification en deux étapes réduisent les risques de fraude au comptoir.';

  @override
  String get securityNecessitePinActuel => 'Nécessite votre PIN actuel';

  @override
  String get securityDesactiverDoubleFacteurCode =>
      'Un code de votre application est demandé';

  @override
  String get securityActiverDoubleFacteurAuthentification =>
      'Un code à 6 chiffres en plus du PIN à chaque connexion';

  @override
  String get securityActive => 'Activé';

  @override
  String get securityInactif => 'Inactif';

  @override
  String get totpEnrollTotpActive => 'Vérification en deux étapes activée';

  @override
  String get totpEnrollActivezDoubleFacteurTotp =>
      'Activez la vérification en deux étapes avec une application comme Google Authenticator. Un code vous sera demandé à chaque connexion, et vous pourrez réinitialiser votre PIN vous-même.';

  @override
  String get totpEnrollCommencerActivation => 'Commencer l’activation';

  @override
  String get totpEnrollCleSecrete => 'Clé secrète';

  @override
  String get totpEnrollScannezQrSaisissezCle =>
      'Scannez le QR code ou saisissez la clé dans votre application, puis entrez le code à 6 chiffres.';

  @override
  String get totpEnrollCodeVerification => 'Code de vérification';

  @override
  String get totpEnrollActiverTotp => 'Activer';

  @override
  String get totpEnrollCleCopiee => 'Clé copiée';

  @override
  String get totpRevokeTotpRevoque => 'Vérification en deux étapes désactivée';

  @override
  String get totpRevokeDesactiverTotpReduitSecurite =>
      'Désactiver la vérification en deux étapes réduit la sécurité de votre compte et vous empêchera de réinitialiser votre PIN vous-même.';

  @override
  String get totpRevokeSaisissezCodeTotpActuel =>
      'Saisissez le code affiché dans votre application pour confirmer';

  @override
  String get commonVenteCarte => 'Vente de carte';

  @override
  String get commonRemplacementCarte => 'Remplacement de carte';

  @override
  String get commonCommission => 'Commission';

  @override
  String get commonFrais => 'Frais';

  @override
  String get commonPerdue => 'Perdue';

  @override
  String get commonVolee => 'Volée';

  @override
  String get commonPasseport => 'Passeport';

  @override
  String get commonAutre => 'Autre';

  @override
  String get commonRevue => 'En revue';

  @override
  String get commonAcceptee => 'Acceptée';

  @override
  String get commonRejetee => 'Rejetée';

  @override
  String get commonAttente => 'En attente';

  @override
  String get commonTransactionIntrouvable => 'Transaction introuvable.';

  @override
  String get commonScannerCarte => 'Scanner la carte';

  @override
  String get commonConfirmer => 'Confirmer';

  @override
  String get commonEffectue => 'Effectué';

  @override
  String get commonAutorise => 'Autorisé';

  @override
  String get commonRefuse => 'Refusé';

  @override
  String get commonAnnule => 'Annulé';

  @override
  String get commonLipa => 'Lipa';

  @override
  String get commonStatut2 => 'Statut';

  @override
  String get commonType => 'Type';

  @override
  String get commonToutePeriode => 'Toute la période';

  @override
  String get commonMontant => 'Montant';

  @override
  String get commonActivite => 'Activité';

  @override
  String get commonImpossibleChargerActivite =>
      'Impossible de charger l’activité.';

  @override
  String get commonReleve => 'Relevé';

  @override
  String commonCopie(Object label) {
    return '$label copié';
  }

  @override
  String get commonDepotClient => 'Dépôt client';

  @override
  String get commonRetraitMarchand => 'Retrait marchand';

  @override
  String get commonOperer => 'Opérer';

  @override
  String get commonCartes => 'Cartes';

  @override
  String get commonProfil => 'Profil';

  @override
  String get commonNumeroTelephone => 'Numéro de téléphone';

  @override
  String get commonNouveauPin => 'Nouveau PIN';

  @override
  String get commonConfirmerPin => 'Confirmer le PIN';

  @override
  String get commonRetourConnexion => '← Retour à la connexion';

  @override
  String get commonReponseInattendueServeur => 'Réponse inattendue du serveur.';

  @override
  String get commonErreurSurvenue => 'Une erreur est survenue.';

  @override
  String get commonStockIndisponible => 'Stock indisponible.';

  @override
  String get commonVendreCarte => 'Vendre une carte';

  @override
  String get commonAnnuler => 'Annuler';

  @override
  String get commonRechercherCarte => 'Rechercher une carte';

  @override
  String get commonRemplacerCarte => 'Remplacer la carte';

  @override
  String get commonRef => 'Réf.';

  @override
  String get commonRechercherClient => 'Rechercher le client';

  @override
  String get commonNumeroClient => 'Numéro du client';

  @override
  String get commonDepot => 'Dépôt';

  @override
  String get commonRetrait => 'Retrait';

  @override
  String get commonCommissions => 'Commissions';

  @override
  String get commonEnrolerClient => 'Enrôler un client';

  @override
  String get commonKycClient => 'KYC client';

  @override
  String get commonProfilIndisponible => 'Profil indisponible.';

  @override
  String get commonPlafonds => 'Plafonds';

  @override
  String get commonChangerMonPin => 'Changer mon PIN';

  @override
  String get commonDesactiverDeuxEtapes =>
      'Désactiver la vérification en deux étapes';

  @override
  String get commonActiverDeuxEtapes =>
      'Activer la vérification en deux étapes';
}
