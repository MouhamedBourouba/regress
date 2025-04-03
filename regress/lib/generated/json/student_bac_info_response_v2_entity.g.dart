import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/student_bac_info_response_v2_entity.dart';
import 'package:regress/domain/models/major.dart';

import 'package:regress/domain/models/student.dart';

import 'package:regress/utils/utils.dart';


StudentBacInfoResponseV2Entity $StudentBacInfoResponseV2EntityFromJson(Map<String, dynamic> json) {
  final StudentBacInfoResponseV2Entity studentBacInfoResponseV2Entity = StudentBacInfoResponseV2Entity();
  final String? anneeAcademiqueCode = jsonConvert.convert<String>(json['anneeAcademiqueCode']);
  if (anneeAcademiqueCode != null) {
    studentBacInfoResponseV2Entity.anneeAcademiqueCode = anneeAcademiqueCode;
  }
  final int? anneeAcademiqueId = jsonConvert.convert<int>(json['anneeAcademiqueId']);
  if (anneeAcademiqueId != null) {
    studentBacInfoResponseV2Entity.anneeAcademiqueId = anneeAcademiqueId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    studentBacInfoResponseV2Entity.id = id;
  }
  final String? individuDateNaissance = jsonConvert.convert<String>(json['individuDateNaissance']);
  if (individuDateNaissance != null) {
    studentBacInfoResponseV2Entity.individuDateNaissance = individuDateNaissance;
  }
  final String? individuLieuNaissance = jsonConvert.convert<String>(json['individuLieuNaissance']);
  if (individuLieuNaissance != null) {
    studentBacInfoResponseV2Entity.individuLieuNaissance = individuLieuNaissance;
  }
  final String? individuLieuNaissanceArabe = jsonConvert.convert<String>(
      json['individuLieuNaissanceArabe']);
  if (individuLieuNaissanceArabe != null) {
    studentBacInfoResponseV2Entity.individuLieuNaissanceArabe = individuLieuNaissanceArabe;
  }
  final String? individuNomArabe = jsonConvert.convert<String>(json['individuNomArabe']);
  if (individuNomArabe != null) {
    studentBacInfoResponseV2Entity.individuNomArabe = individuNomArabe;
  }
  final String? individuNomLatin = jsonConvert.convert<String>(json['individuNomLatin']);
  if (individuNomLatin != null) {
    studentBacInfoResponseV2Entity.individuNomLatin = individuNomLatin;
  }
  final String? individuPrenomArabe = jsonConvert.convert<String>(json['individuPrenomArabe']);
  if (individuPrenomArabe != null) {
    studentBacInfoResponseV2Entity.individuPrenomArabe = individuPrenomArabe;
  }
  final String? individuPrenomLatin = jsonConvert.convert<String>(json['individuPrenomLatin']);
  if (individuPrenomLatin != null) {
    studentBacInfoResponseV2Entity.individuPrenomLatin = individuPrenomLatin;
  }
  final String? llEtablissementArabe = jsonConvert.convert<String>(json['llEtablissementArabe']);
  if (llEtablissementArabe != null) {
    studentBacInfoResponseV2Entity.llEtablissementArabe = llEtablissementArabe;
  }
  final String? llEtablissementLatin = jsonConvert.convert<String>(json['llEtablissementLatin']);
  if (llEtablissementLatin != null) {
    studentBacInfoResponseV2Entity.llEtablissementLatin = llEtablissementLatin;
  }
  final int? niveauId = jsonConvert.convert<int>(json['niveauId']);
  if (niveauId != null) {
    studentBacInfoResponseV2Entity.niveauId = niveauId;
  }
  final String? niveauLibelleLongAr = jsonConvert.convert<String>(json['niveauLibelleLongAr']);
  if (niveauLibelleLongAr != null) {
    studentBacInfoResponseV2Entity.niveauLibelleLongAr = niveauLibelleLongAr;
  }
  final String? niveauLibelleLongLt = jsonConvert.convert<String>(json['niveauLibelleLongLt']);
  if (niveauLibelleLongLt != null) {
    studentBacInfoResponseV2Entity.niveauLibelleLongLt = niveauLibelleLongLt;
  }
  final String? numeroInscription = jsonConvert.convert<String>(json['numeroInscription']);
  if (numeroInscription != null) {
    studentBacInfoResponseV2Entity.numeroInscription = numeroInscription;
  }
  final String? ofLlDomaine = jsonConvert.convert<String>(json['ofLlDomaine']);
  if (ofLlDomaine != null) {
    studentBacInfoResponseV2Entity.ofLlDomaine = ofLlDomaine;
  }
  final String? ofLlDomaineArabe = jsonConvert.convert<String>(json['ofLlDomaineArabe']);
  if (ofLlDomaineArabe != null) {
    studentBacInfoResponseV2Entity.ofLlDomaineArabe = ofLlDomaineArabe;
  }
  final String? ofLlFiliere = jsonConvert.convert<String>(json['ofLlFiliere']);
  if (ofLlFiliere != null) {
    studentBacInfoResponseV2Entity.ofLlFiliere = ofLlFiliere;
  }
  final String? ofLlFiliereArabe = jsonConvert.convert<String>(json['ofLlFiliereArabe']);
  if (ofLlFiliereArabe != null) {
    studentBacInfoResponseV2Entity.ofLlFiliereArabe = ofLlFiliereArabe;
  }
  final int? ouvertureOffreFormationId = jsonConvert.convert<int>(
      json['ouvertureOffreFormationId']);
  if (ouvertureOffreFormationId != null) {
    studentBacInfoResponseV2Entity.ouvertureOffreFormationId = ouvertureOffreFormationId;
  }
  final String? refLibelleCycle = jsonConvert.convert<String>(json['refLibelleCycle']);
  if (refLibelleCycle != null) {
    studentBacInfoResponseV2Entity.refLibelleCycle = refLibelleCycle;
  }
  final String? refLibelleCycleAr = jsonConvert.convert<String>(json['refLibelleCycleAr']);
  if (refLibelleCycleAr != null) {
    studentBacInfoResponseV2Entity.refLibelleCycleAr = refLibelleCycleAr;
  }
  final int? situationId = jsonConvert.convert<int>(json['situationId']);
  if (situationId != null) {
    studentBacInfoResponseV2Entity.situationId = situationId;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    studentBacInfoResponseV2Entity.uuid = uuid;
  }
  return studentBacInfoResponseV2Entity;
}

Map<String, dynamic> $StudentBacInfoResponseV2EntityToJson(StudentBacInfoResponseV2Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['anneeAcademiqueCode'] = entity.anneeAcademiqueCode;
  data['anneeAcademiqueId'] = entity.anneeAcademiqueId;
  data['id'] = entity.id;
  data['individuDateNaissance'] = entity.individuDateNaissance;
  data['individuLieuNaissance'] = entity.individuLieuNaissance;
  data['individuLieuNaissanceArabe'] = entity.individuLieuNaissanceArabe;
  data['individuNomArabe'] = entity.individuNomArabe;
  data['individuNomLatin'] = entity.individuNomLatin;
  data['individuPrenomArabe'] = entity.individuPrenomArabe;
  data['individuPrenomLatin'] = entity.individuPrenomLatin;
  data['llEtablissementArabe'] = entity.llEtablissementArabe;
  data['llEtablissementLatin'] = entity.llEtablissementLatin;
  data['niveauId'] = entity.niveauId;
  data['niveauLibelleLongAr'] = entity.niveauLibelleLongAr;
  data['niveauLibelleLongLt'] = entity.niveauLibelleLongLt;
  data['numeroInscription'] = entity.numeroInscription;
  data['ofLlDomaine'] = entity.ofLlDomaine;
  data['ofLlDomaineArabe'] = entity.ofLlDomaineArabe;
  data['ofLlFiliere'] = entity.ofLlFiliere;
  data['ofLlFiliereArabe'] = entity.ofLlFiliereArabe;
  data['ouvertureOffreFormationId'] = entity.ouvertureOffreFormationId;
  data['refLibelleCycle'] = entity.refLibelleCycle;
  data['refLibelleCycleAr'] = entity.refLibelleCycleAr;
  data['situationId'] = entity.situationId;
  data['uuid'] = entity.uuid;
  return data;
}

extension StudentBacInfoResponseV2EntityExtension on StudentBacInfoResponseV2Entity {
  StudentBacInfoResponseV2Entity copyWith({
    String? anneeAcademiqueCode,
    int? anneeAcademiqueId,
    int? id,
    String? individuDateNaissance,
    String? individuLieuNaissance,
    String? individuLieuNaissanceArabe,
    String? individuNomArabe,
    String? individuNomLatin,
    String? individuPrenomArabe,
    String? individuPrenomLatin,
    String? llEtablissementArabe,
    String? llEtablissementLatin,
    int? niveauId,
    String? niveauLibelleLongAr,
    String? niveauLibelleLongLt,
    String? numeroInscription,
    String? ofLlDomaine,
    String? ofLlDomaineArabe,
    String? ofLlFiliere,
    String? ofLlFiliereArabe,
    int? ouvertureOffreFormationId,
    String? refLibelleCycle,
    String? refLibelleCycleAr,
    int? situationId,
    String? uuid,
  }) {
    return StudentBacInfoResponseV2Entity()
      ..anneeAcademiqueCode = anneeAcademiqueCode ?? this.anneeAcademiqueCode
      ..anneeAcademiqueId = anneeAcademiqueId ?? this.anneeAcademiqueId
      ..id = id ?? this.id
      ..individuDateNaissance = individuDateNaissance ?? this.individuDateNaissance
      ..individuLieuNaissance = individuLieuNaissance ?? this.individuLieuNaissance
      ..individuLieuNaissanceArabe = individuLieuNaissanceArabe ?? this.individuLieuNaissanceArabe
      ..individuNomArabe = individuNomArabe ?? this.individuNomArabe
      ..individuNomLatin = individuNomLatin ?? this.individuNomLatin
      ..individuPrenomArabe = individuPrenomArabe ?? this.individuPrenomArabe
      ..individuPrenomLatin = individuPrenomLatin ?? this.individuPrenomLatin
      ..llEtablissementArabe = llEtablissementArabe ?? this.llEtablissementArabe
      ..llEtablissementLatin = llEtablissementLatin ?? this.llEtablissementLatin
      ..niveauId = niveauId ?? this.niveauId
      ..niveauLibelleLongAr = niveauLibelleLongAr ?? this.niveauLibelleLongAr
      ..niveauLibelleLongLt = niveauLibelleLongLt ?? this.niveauLibelleLongLt
      ..numeroInscription = numeroInscription ?? this.numeroInscription
      ..ofLlDomaine = ofLlDomaine ?? this.ofLlDomaine
      ..ofLlDomaineArabe = ofLlDomaineArabe ?? this.ofLlDomaineArabe
      ..ofLlFiliere = ofLlFiliere ?? this.ofLlFiliere
      ..ofLlFiliereArabe = ofLlFiliereArabe ?? this.ofLlFiliereArabe
      ..ouvertureOffreFormationId = ouvertureOffreFormationId ?? this.ouvertureOffreFormationId
      ..refLibelleCycle = refLibelleCycle ?? this.refLibelleCycle
      ..refLibelleCycleAr = refLibelleCycleAr ?? this.refLibelleCycleAr
      ..situationId = situationId ?? this.situationId
      ..uuid = uuid ?? this.uuid;
  }
}