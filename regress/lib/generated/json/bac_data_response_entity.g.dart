import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/bac_data_response_entity.dart';


BacDataResponseEntity $BacDataResponseEntityFromJson(Map<String, dynamic> json) {
  final BacDataResponseEntity bacDataResponseEntity = BacDataResponseEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    bacDataResponseEntity.id = id;
  }
  final String? numeroInscription = jsonConvert.convert<String>(json['numeroInscription']);
  if (numeroInscription != null) {
    bacDataResponseEntity.numeroInscription = numeroInscription;
  }
  final double? anneeAcademiqueId = jsonConvert.convert<double>(json['anneeAcademiqueId']);
  if (anneeAcademiqueId != null) {
    bacDataResponseEntity.anneeAcademiqueId = anneeAcademiqueId;
  }
  final String? anneeAcademiqueCode = jsonConvert.convert<String>(json['anneeAcademiqueCode']);
  if (anneeAcademiqueCode != null) {
    bacDataResponseEntity.anneeAcademiqueCode = anneeAcademiqueCode;
  }
  final double? situationId = jsonConvert.convert<double>(json['situationId']);
  if (situationId != null) {
    bacDataResponseEntity.situationId = situationId;
  }
  final double? dossierEtudiantId = jsonConvert.convert<double>(json['dossierEtudiantId']);
  if (dossierEtudiantId != null) {
    bacDataResponseEntity.dossierEtudiantId = dossierEtudiantId;
  }
  final String? numeroMatricule = jsonConvert.convert<String>(json['numeroMatricule']);
  if (numeroMatricule != null) {
    bacDataResponseEntity.numeroMatricule = numeroMatricule;
  }
  final double? ouvertureOffreFormationId = jsonConvert.convert<double>(
      json['ouvertureOffreFormationId']);
  if (ouvertureOffreFormationId != null) {
    bacDataResponseEntity.ouvertureOffreFormationId = ouvertureOffreFormationId;
  }
  final String? refCodeCycle = jsonConvert.convert<String>(json['refCodeCycle']);
  if (refCodeCycle != null) {
    bacDataResponseEntity.refCodeCycle = refCodeCycle;
  }
  final String? refLibelleCycle = jsonConvert.convert<String>(json['refLibelleCycle']);
  if (refLibelleCycle != null) {
    bacDataResponseEntity.refLibelleCycle = refLibelleCycle;
  }
  final String? refLibelleCycleAr = jsonConvert.convert<String>(json['refLibelleCycleAr']);
  if (refLibelleCycleAr != null) {
    bacDataResponseEntity.refLibelleCycleAr = refLibelleCycleAr;
  }
  final double? ofIdDomaine = jsonConvert.convert<double>(json['ofIdDomaine']);
  if (ofIdDomaine != null) {
    bacDataResponseEntity.ofIdDomaine = ofIdDomaine;
  }
  final String? ofCodeDomaine = jsonConvert.convert<String>(json['ofCodeDomaine']);
  if (ofCodeDomaine != null) {
    bacDataResponseEntity.ofCodeDomaine = ofCodeDomaine;
  }
  final String? ofLlDomaine = jsonConvert.convert<String>(json['ofLlDomaine']);
  if (ofLlDomaine != null) {
    bacDataResponseEntity.ofLlDomaine = ofLlDomaine;
  }
  final String? ofLlDomaineArabe = jsonConvert.convert<String>(json['ofLlDomaineArabe']);
  if (ofLlDomaineArabe != null) {
    bacDataResponseEntity.ofLlDomaineArabe = ofLlDomaineArabe;
  }
  final double? ofIdFiliere = jsonConvert.convert<double>(json['ofIdFiliere']);
  if (ofIdFiliere != null) {
    bacDataResponseEntity.ofIdFiliere = ofIdFiliere;
  }
  final String? ofCodeFiliere = jsonConvert.convert<String>(json['ofCodeFiliere']);
  if (ofCodeFiliere != null) {
    bacDataResponseEntity.ofCodeFiliere = ofCodeFiliere;
  }
  final String? ofLlFiliereArabe = jsonConvert.convert<String>(json['ofLlFiliereArabe']);
  if (ofLlFiliereArabe != null) {
    bacDataResponseEntity.ofLlFiliereArabe = ofLlFiliereArabe;
  }
  final String? ofLlFiliere = jsonConvert.convert<String>(json['ofLlFiliere']);
  if (ofLlFiliere != null) {
    bacDataResponseEntity.ofLlFiliere = ofLlFiliere;
  }
  final double? individuId = jsonConvert.convert<double>(json['individuId']);
  if (individuId != null) {
    bacDataResponseEntity.individuId = individuId;
  }
  final String? nin = jsonConvert.convert<String>(json['nin']);
  if (nin != null) {
    bacDataResponseEntity.nin = nin;
  }
  final String? individuNomArabe = jsonConvert.convert<String>(json['individuNomArabe']);
  if (individuNomArabe != null) {
    bacDataResponseEntity.individuNomArabe = individuNomArabe;
  }
  final String? individuNomLatin = jsonConvert.convert<String>(json['individuNomLatin']);
  if (individuNomLatin != null) {
    bacDataResponseEntity.individuNomLatin = individuNomLatin;
  }
  final String? individuPrenomArabe = jsonConvert.convert<String>(json['individuPrenomArabe']);
  if (individuPrenomArabe != null) {
    bacDataResponseEntity.individuPrenomArabe = individuPrenomArabe;
  }
  final String? individuPrenomLatin = jsonConvert.convert<String>(json['individuPrenomLatin']);
  if (individuPrenomLatin != null) {
    bacDataResponseEntity.individuPrenomLatin = individuPrenomLatin;
  }
  final String? individuDateNaissance = jsonConvert.convert<String>(json['individuDateNaissance']);
  if (individuDateNaissance != null) {
    bacDataResponseEntity.individuDateNaissance = individuDateNaissance;
  }
  final String? individuLieuNaissance = jsonConvert.convert<String>(json['individuLieuNaissance']);
  if (individuLieuNaissance != null) {
    bacDataResponseEntity.individuLieuNaissance = individuLieuNaissance;
  }
  final String? individuLieuNaissanceArabe = jsonConvert.convert<String>(
      json['individuLieuNaissanceArabe']);
  if (individuLieuNaissanceArabe != null) {
    bacDataResponseEntity.individuLieuNaissanceArabe = individuLieuNaissanceArabe;
  }
  final double? refEtablissementId = jsonConvert.convert<double>(json['refEtablissementId']);
  if (refEtablissementId != null) {
    bacDataResponseEntity.refEtablissementId = refEtablissementId;
  }
  final String? refCodeEtablissement = jsonConvert.convert<String>(json['refCodeEtablissement']);
  if (refCodeEtablissement != null) {
    bacDataResponseEntity.refCodeEtablissement = refCodeEtablissement;
  }
  final String? llEtablissementArabe = jsonConvert.convert<String>(json['llEtablissementArabe']);
  if (llEtablissementArabe != null) {
    bacDataResponseEntity.llEtablissementArabe = llEtablissementArabe;
  }
  final String? llEtablissementLatin = jsonConvert.convert<String>(json['llEtablissementLatin']);
  if (llEtablissementLatin != null) {
    bacDataResponseEntity.llEtablissementLatin = llEtablissementLatin;
  }
  final double? moyenneBac = jsonConvert.convert<double>(json['moyenneBac']);
  if (moyenneBac != null) {
    bacDataResponseEntity.moyenneBac = moyenneBac;
  }
  final double? lastMoyenne = jsonConvert.convert<double>(json['lastMoyenne']);
  if (lastMoyenne != null) {
    bacDataResponseEntity.lastMoyenne = lastMoyenne;
  }
  final String? photo = jsonConvert.convert<String>(json['photo']);
  if (photo != null) {
    bacDataResponseEntity.photo = photo;
  }
  final double? cycleId = jsonConvert.convert<double>(json['cycleId']);
  if (cycleId != null) {
    bacDataResponseEntity.cycleId = cycleId;
  }
  final String? cycleCode = jsonConvert.convert<String>(json['cycleCode']);
  if (cycleCode != null) {
    bacDataResponseEntity.cycleCode = cycleCode;
  }
  final String? cycleLibelleLongLt = jsonConvert.convert<String>(json['cycleLibelleLongLt']);
  if (cycleLibelleLongLt != null) {
    bacDataResponseEntity.cycleLibelleLongLt = cycleLibelleLongLt;
  }
  final double? niveauId = jsonConvert.convert<double>(json['niveauId']);
  if (niveauId != null) {
    bacDataResponseEntity.niveauId = niveauId;
  }
  final String? niveauCode = jsonConvert.convert<String>(json['niveauCode']);
  if (niveauCode != null) {
    bacDataResponseEntity.niveauCode = niveauCode;
  }
  final double? niveauRang = jsonConvert.convert<double>(json['niveauRang']);
  if (niveauRang != null) {
    bacDataResponseEntity.niveauRang = niveauRang;
  }
  final String? niveauLibelleLongLt = jsonConvert.convert<String>(json['niveauLibelleLongLt']);
  if (niveauLibelleLongLt != null) {
    bacDataResponseEntity.niveauLibelleLongLt = niveauLibelleLongLt;
  }
  final String? niveauLibelleLongAr = jsonConvert.convert<String>(json['niveauLibelleLongAr']);
  if (niveauLibelleLongAr != null) {
    bacDataResponseEntity.niveauLibelleLongAr = niveauLibelleLongAr;
  }
  final bool? transportPaye = jsonConvert.convert<bool>(json['transportPaye']);
  if (transportPaye != null) {
    bacDataResponseEntity.transportPaye = transportPaye;
  }
  final bool? fraisInscriptionPaye = jsonConvert.convert<bool>(json['fraisInscriptionPaye']);
  if (fraisInscriptionPaye != null) {
    bacDataResponseEntity.fraisInscriptionPaye = fraisInscriptionPaye;
  }
  return bacDataResponseEntity;
}

Map<String, dynamic> $BacDataResponseEntityToJson(BacDataResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['numeroInscription'] = entity.numeroInscription;
  data['anneeAcademiqueId'] = entity.anneeAcademiqueId;
  data['anneeAcademiqueCode'] = entity.anneeAcademiqueCode;
  data['situationId'] = entity.situationId;
  data['dossierEtudiantId'] = entity.dossierEtudiantId;
  data['numeroMatricule'] = entity.numeroMatricule;
  data['ouvertureOffreFormationId'] = entity.ouvertureOffreFormationId;
  data['refCodeCycle'] = entity.refCodeCycle;
  data['refLibelleCycle'] = entity.refLibelleCycle;
  data['refLibelleCycleAr'] = entity.refLibelleCycleAr;
  data['ofIdDomaine'] = entity.ofIdDomaine;
  data['ofCodeDomaine'] = entity.ofCodeDomaine;
  data['ofLlDomaine'] = entity.ofLlDomaine;
  data['ofLlDomaineArabe'] = entity.ofLlDomaineArabe;
  data['ofIdFiliere'] = entity.ofIdFiliere;
  data['ofCodeFiliere'] = entity.ofCodeFiliere;
  data['ofLlFiliereArabe'] = entity.ofLlFiliereArabe;
  data['ofLlFiliere'] = entity.ofLlFiliere;
  data['individuId'] = entity.individuId;
  data['nin'] = entity.nin;
  data['individuNomArabe'] = entity.individuNomArabe;
  data['individuNomLatin'] = entity.individuNomLatin;
  data['individuPrenomArabe'] = entity.individuPrenomArabe;
  data['individuPrenomLatin'] = entity.individuPrenomLatin;
  data['individuDateNaissance'] = entity.individuDateNaissance;
  data['individuLieuNaissance'] = entity.individuLieuNaissance;
  data['individuLieuNaissanceArabe'] = entity.individuLieuNaissanceArabe;
  data['refEtablissementId'] = entity.refEtablissementId;
  data['refCodeEtablissement'] = entity.refCodeEtablissement;
  data['llEtablissementArabe'] = entity.llEtablissementArabe;
  data['llEtablissementLatin'] = entity.llEtablissementLatin;
  data['moyenneBac'] = entity.moyenneBac;
  data['lastMoyenne'] = entity.lastMoyenne;
  data['photo'] = entity.photo;
  data['cycleId'] = entity.cycleId;
  data['cycleCode'] = entity.cycleCode;
  data['cycleLibelleLongLt'] = entity.cycleLibelleLongLt;
  data['niveauId'] = entity.niveauId;
  data['niveauCode'] = entity.niveauCode;
  data['niveauRang'] = entity.niveauRang;
  data['niveauLibelleLongLt'] = entity.niveauLibelleLongLt;
  data['niveauLibelleLongAr'] = entity.niveauLibelleLongAr;
  data['transportPaye'] = entity.transportPaye;
  data['fraisInscriptionPaye'] = entity.fraisInscriptionPaye;
  return data;
}

extension BacDataResponseEntityExtension on BacDataResponseEntity {
  BacDataResponseEntity copyWith({
    double? id,
    String? numeroInscription,
    double? anneeAcademiqueId,
    String? anneeAcademiqueCode,
    double? situationId,
    double? dossierEtudiantId,
    String? numeroMatricule,
    double? ouvertureOffreFormationId,
    String? refCodeCycle,
    String? refLibelleCycle,
    String? refLibelleCycleAr,
    double? ofIdDomaine,
    String? ofCodeDomaine,
    String? ofLlDomaine,
    String? ofLlDomaineArabe,
    double? ofIdFiliere,
    String? ofCodeFiliere,
    String? ofLlFiliereArabe,
    String? ofLlFiliere,
    double? individuId,
    String? nin,
    String? individuNomArabe,
    String? individuNomLatin,
    String? individuPrenomArabe,
    String? individuPrenomLatin,
    String? individuDateNaissance,
    String? individuLieuNaissance,
    String? individuLieuNaissanceArabe,
    double? refEtablissementId,
    String? refCodeEtablissement,
    String? llEtablissementArabe,
    String? llEtablissementLatin,
    double? moyenneBac,
    double? lastMoyenne,
    String? photo,
    double? cycleId,
    String? cycleCode,
    String? cycleLibelleLongLt,
    double? niveauId,
    String? niveauCode,
    double? niveauRang,
    String? niveauLibelleLongLt,
    String? niveauLibelleLongAr,
    bool? transportPaye,
    bool? fraisInscriptionPaye,
  }) {
    return BacDataResponseEntity()
      ..id = id ?? this.id
      ..numeroInscription = numeroInscription ?? this.numeroInscription
      ..anneeAcademiqueId = anneeAcademiqueId ?? this.anneeAcademiqueId
      ..anneeAcademiqueCode = anneeAcademiqueCode ?? this.anneeAcademiqueCode
      ..situationId = situationId ?? this.situationId
      ..dossierEtudiantId = dossierEtudiantId ?? this.dossierEtudiantId
      ..numeroMatricule = numeroMatricule ?? this.numeroMatricule
      ..ouvertureOffreFormationId = ouvertureOffreFormationId ?? this.ouvertureOffreFormationId
      ..refCodeCycle = refCodeCycle ?? this.refCodeCycle
      ..refLibelleCycle = refLibelleCycle ?? this.refLibelleCycle
      ..refLibelleCycleAr = refLibelleCycleAr ?? this.refLibelleCycleAr
      ..ofIdDomaine = ofIdDomaine ?? this.ofIdDomaine
      ..ofCodeDomaine = ofCodeDomaine ?? this.ofCodeDomaine
      ..ofLlDomaine = ofLlDomaine ?? this.ofLlDomaine
      ..ofLlDomaineArabe = ofLlDomaineArabe ?? this.ofLlDomaineArabe
      ..ofIdFiliere = ofIdFiliere ?? this.ofIdFiliere
      ..ofCodeFiliere = ofCodeFiliere ?? this.ofCodeFiliere
      ..ofLlFiliereArabe = ofLlFiliereArabe ?? this.ofLlFiliereArabe
      ..ofLlFiliere = ofLlFiliere ?? this.ofLlFiliere
      ..individuId = individuId ?? this.individuId
      ..nin = nin ?? this.nin
      ..individuNomArabe = individuNomArabe ?? this.individuNomArabe
      ..individuNomLatin = individuNomLatin ?? this.individuNomLatin
      ..individuPrenomArabe = individuPrenomArabe ?? this.individuPrenomArabe
      ..individuPrenomLatin = individuPrenomLatin ?? this.individuPrenomLatin
      ..individuDateNaissance = individuDateNaissance ?? this.individuDateNaissance
      ..individuLieuNaissance = individuLieuNaissance ?? this.individuLieuNaissance
      ..individuLieuNaissanceArabe = individuLieuNaissanceArabe ?? this.individuLieuNaissanceArabe
      ..refEtablissementId = refEtablissementId ?? this.refEtablissementId
      ..refCodeEtablissement = refCodeEtablissement ?? this.refCodeEtablissement
      ..llEtablissementArabe = llEtablissementArabe ?? this.llEtablissementArabe
      ..llEtablissementLatin = llEtablissementLatin ?? this.llEtablissementLatin
      ..moyenneBac = moyenneBac ?? this.moyenneBac
      ..lastMoyenne = lastMoyenne ?? this.lastMoyenne
      ..photo = photo ?? this.photo
      ..cycleId = cycleId ?? this.cycleId
      ..cycleCode = cycleCode ?? this.cycleCode
      ..cycleLibelleLongLt = cycleLibelleLongLt ?? this.cycleLibelleLongLt
      ..niveauId = niveauId ?? this.niveauId
      ..niveauCode = niveauCode ?? this.niveauCode
      ..niveauRang = niveauRang ?? this.niveauRang
      ..niveauLibelleLongLt = niveauLibelleLongLt ?? this.niveauLibelleLongLt
      ..niveauLibelleLongAr = niveauLibelleLongAr ?? this.niveauLibelleLongAr
      ..transportPaye = transportPaye ?? this.transportPaye
      ..fraisInscriptionPaye = fraisInscriptionPaye ?? this.fraisInscriptionPaye;
  }
}
