import 'package:regress/domain/models/major.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/student_bac_info_response_v2_entity.g.dart';
import 'dart:convert';

import 'package:regress/utils/utils.dart';
export 'package:regress/generated/json/student_bac_info_response_v2_entity.g.dart';

@JsonSerializable()
class StudentBacInfoResponseV2Entity {
	late String? anneeAcademiqueCode;
	late int? anneeAcademiqueId;
	late int? id;
	late String? individuDateNaissance;
	late String? individuLieuNaissance;
	late String? individuLieuNaissanceArabe;
	late String? individuNomArabe;
	late String? individuNomLatin;
	late String? individuPrenomArabe;
	late String? individuPrenomLatin;
	late String? llEtablissementArabe;
	late String? llEtablissementLatin;
	late int? niveauId;
	late String? niveauLibelleLongAr;
	late String? niveauLibelleLongLt;
	late String? numeroInscription;
	late String? ofLlDomaine;
	late String? ofLlDomaineArabe;
	late String? ofLlFiliere;
	late String? ofLlFiliereArabe;
	late int? ouvertureOffreFormationId;
	late String? refLibelleCycle;
	late String? refLibelleCycleAr;
	late int? situationId;
	late String? uuid;

	StudentBacInfoResponseV2Entity();

	factory StudentBacInfoResponseV2Entity.fromJson(Map<String, dynamic> json) => $StudentBacInfoResponseV2EntityFromJson(json);

	Map<String, dynamic> toJson() => $StudentBacInfoResponseV2EntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	Student toStudent() => Student(
		registrationNumber: numeroInscription ?? "N/A",
		lastName: individuNomLatin ?? "N/A",
		firstName: individuPrenomLatin ?? "N/A",
		birthDate: individuDateNaissance ?? "N/A",
		birthPlace: individuLieuNaissance ?? "N/A",
		major: Major(
			domain: ofLlDomaine ?? "N/A",
			sector: ofLlFiliere ?? "N/A",
			level: niveauLibelleLongLt ?? "N/A",
		),
		universityName: llEtablissementLatin ?? "N/A",
	);
}