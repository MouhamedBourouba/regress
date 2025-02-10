import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/bac_data_response_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/bac_data_response_entity.g.dart';

@JsonSerializable()
class BacDataResponseEntity {
	late double id;
	late String numeroInscription;
	late double anneeAcademiqueId;
	late String anneeAcademiqueCode;
	late double situationId;
	late double dossierEtudiantId;
	late String numeroMatricule;
	late double ouvertureOffreFormationId;
	late String refCodeCycle;
	late String refLibelleCycle;
	late String refLibelleCycleAr;
	late double ofIdDomaine;
	late String ofCodeDomaine;
	late String ofLlDomaine;
	late String ofLlDomaineArabe;
	late double ofIdFiliere;
	late String ofCodeFiliere;
	late String ofLlFiliereArabe;
	late String ofLlFiliere;
	late double individuId;
	late String nin;
	late String individuNomArabe;
	late String individuNomLatin;
	late String individuPrenomArabe;
	late String individuPrenomLatin;
	late String individuDateNaissance;
	late String individuLieuNaissance;
	late String individuLieuNaissanceArabe;
	late double refEtablissementId;
	late String refCodeEtablissement;
	late String llEtablissementArabe;
	late String llEtablissementLatin;
	late double moyenneBac;
	late double lastMoyenne;
	late String photo;
	late double cycleId;
	late String cycleCode;
	late String cycleLibelleLongLt;
	late double niveauId;
	late String niveauCode;
	late double niveauRang;
	late String niveauLibelleLongLt;
	late String niveauLibelleLongAr;
	late bool transportPaye;
	late bool fraisInscriptionPaye;

	BacDataResponseEntity();

	factory BacDataResponseEntity.fromJson(Map<String, dynamic> json) => $BacDataResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $BacDataResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}