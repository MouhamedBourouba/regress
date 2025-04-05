import 'dart:convert';

import 'package:regress/domain/models/major.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/generated/json/bac_data_response_entity.g.dart';
import 'package:regress/generated/json/base/json_field.dart';

export 'package:regress/generated/json/bac_data_response_entity.g.dart';

@JsonSerializable()
class BacDataResponseEntity {
  double? id;
  String? numeroInscription;
  double? anneeAcademiqueId;
  String? anneeAcademiqueCode;
  double? situationId;
  double? dossierEtudiantId;
  String? numeroMatricule;
  double? ouvertureOffreFormationId;
  String? refCodeCycle;
  String? refLibelleCycle;
  String? refLibelleCycleAr;
  double? ofIdDomaine;
  String? ofCodeDomaine;
  String? ofLlDomaine;
  String? ofLlDomaineArabe;
  double? ofIdFiliere;
  String? ofCodeFiliere;
  String? ofLlFiliereArabe;
  String? ofLlFiliere;
  double? individuId;
  String? nin;
  String? individuNomArabe;
  String? individuNomLatin;
  String? individuPrenomArabe;
  String? individuPrenomLatin;
  String? individuDateNaissance;
  String? individuLieuNaissance;
  String? individuLieuNaissanceArabe;
  double? refEtablissementId;
  String? refCodeEtablissement;
  String? llEtablissementArabe;
  String? llEtablissementLatin;
  double? moyenneBac;
  double? lastMoyenne;
  String? photo;
  double? cycleId;
  String? cycleCode;
  String? cycleLibelleLongLt;
  double? niveauId;
  String? niveauCode;
  double? niveauRang;
  String? niveauLibelleLongLt;
  String? niveauLibelleLongAr;
  bool? transportPaye;
  bool? fraisInscriptionPaye;

  BacDataResponseEntity();

  factory BacDataResponseEntity.fromJson(Map<String, dynamic> json) => $BacDataResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BacDataResponseEntityToJson(this);

  @override
  String toString() => jsonEncode(this);

  Student toStudent() => Student(
        registrationNumber: numeroInscription ?? "N/A",
        lastName: individuNomLatin ?? "N/A",
        firstName: individuPrenomLatin ?? "N/A",
        birthDate: individuDateNaissance ?? "N/A",
        birthPlace: individuLieuNaissance ?? "N/A",
        major: Major(
          domain: ofLlDomaine ?? "N/A",
          sector: ofLlFiliere ?? "N/A",
          level: niveauCode ?? "N/A",
        ),
        universityName: llEtablissementLatin ?? "N/A",
      );
}
