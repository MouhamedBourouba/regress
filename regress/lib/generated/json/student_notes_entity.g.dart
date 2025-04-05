import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/student_notes_entity.dart';

StudentNotesEntity $StudentNotesEntityFromJson(Map<String, dynamic> json) {
  final StudentNotesEntity studentNotesEntity = StudentNotesEntity();
  final bool? autorisationDemandeRecours = jsonConvert.convert<bool>(json['autorisationDemandeRecours']);
  if (autorisationDemandeRecours != null) {
    studentNotesEntity.autorisationDemandeRecours = autorisationDemandeRecours;
  }
  final String? dateDebutDepotRecours = jsonConvert.convert<String>(json['dateDebutDepotRecours']);
  if (dateDebutDepotRecours != null) {
    studentNotesEntity.dateDebutDepotRecours = dateDebutDepotRecours;
  }
  final String? dateLimiteDepotRecours = jsonConvert.convert<String>(json['dateLimiteDepotRecours']);
  if (dateLimiteDepotRecours != null) {
    studentNotesEntity.dateLimiteDepotRecours = dateLimiteDepotRecours;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    studentNotesEntity.id = id;
  }
  final double? idPeriode = jsonConvert.convert<double>(json['idPeriode']);
  if (idPeriode != null) {
    studentNotesEntity.idPeriode = idPeriode;
  }
  final double? idDia = jsonConvert.convert<double>(json['id_dia']);
  if (idDia != null) {
    studentNotesEntity.idDia = idDia;
  }
  final String? mcLibelleAr = jsonConvert.convert<String>(json['mcLibelleAr']);
  if (mcLibelleAr != null) {
    studentNotesEntity.mcLibelleAr = mcLibelleAr;
  }
  final String? mcLibelleFr = jsonConvert.convert<String>(json['mcLibelleFr']);
  if (mcLibelleFr != null) {
    studentNotesEntity.mcLibelleFr = mcLibelleFr;
  }
  final double? noteExamen = jsonConvert.convert<double>(json['noteExamen']);
  if (noteExamen != null) {
    studentNotesEntity.noteExamen = noteExamen;
  }
  final double? planningSessionId = jsonConvert.convert<double>(json['planningSessionId']);
  if (planningSessionId != null) {
    studentNotesEntity.planningSessionId = planningSessionId;
  }
  final String? planningSessionIntitule = jsonConvert.convert<String>(json['planningSessionIntitule']);
  if (planningSessionIntitule != null) {
    studentNotesEntity.planningSessionIntitule = planningSessionIntitule;
  }
  final double? rattachementMcCoefficient = jsonConvert.convert<double>(json['rattachementMcCoefficient']);
  if (rattachementMcCoefficient != null) {
    studentNotesEntity.rattachementMcCoefficient = rattachementMcCoefficient;
  }
  final double? rattachementMcId = jsonConvert.convert<double>(json['rattachementMcId']);
  if (rattachementMcId != null) {
    studentNotesEntity.rattachementMcId = rattachementMcId;
  }
  return studentNotesEntity;
}

Map<String, dynamic> $StudentNotesEntityToJson(StudentNotesEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['autorisationDemandeRecours'] = entity.autorisationDemandeRecours;
  data['dateDebutDepotRecours'] = entity.dateDebutDepotRecours;
  data['dateLimiteDepotRecours'] = entity.dateLimiteDepotRecours;
  data['id'] = entity.id;
  data['idPeriode'] = entity.idPeriode;
  data['id_dia'] = entity.idDia;
  data['mcLibelleAr'] = entity.mcLibelleAr;
  data['mcLibelleFr'] = entity.mcLibelleFr;
  data['noteExamen'] = entity.noteExamen;
  data['planningSessionId'] = entity.planningSessionId;
  data['planningSessionIntitule'] = entity.planningSessionIntitule;
  data['rattachementMcCoefficient'] = entity.rattachementMcCoefficient;
  data['rattachementMcId'] = entity.rattachementMcId;
  return data;
}

extension StudentNotesEntityExtension on StudentNotesEntity {
  StudentNotesEntity copyWith({
    bool? autorisationDemandeRecours,
    String? dateDebutDepotRecours,
    String? dateLimiteDepotRecours,
    double? id,
    double? idPeriode,
    double? idDia,
    String? mcLibelleAr,
    String? mcLibelleFr,
    double? noteExamen,
    double? planningSessionId,
    String? planningSessionIntitule,
    double? rattachementMcCoefficient,
    double? rattachementMcId,
    dynamic recoursAccorde,
    dynamic recoursDemande,
  }) {
    return StudentNotesEntity()
      ..autorisationDemandeRecours = autorisationDemandeRecours ?? this.autorisationDemandeRecours
      ..dateDebutDepotRecours = dateDebutDepotRecours ?? this.dateDebutDepotRecours
      ..dateLimiteDepotRecours = dateLimiteDepotRecours ?? this.dateLimiteDepotRecours
      ..id = id ?? this.id
      ..idPeriode = idPeriode ?? this.idPeriode
      ..idDia = idDia ?? this.idDia
      ..mcLibelleAr = mcLibelleAr ?? this.mcLibelleAr
      ..mcLibelleFr = mcLibelleFr ?? this.mcLibelleFr
      ..noteExamen = noteExamen ?? this.noteExamen
      ..planningSessionId = planningSessionId ?? this.planningSessionId
      ..planningSessionIntitule = planningSessionIntitule ?? this.planningSessionIntitule
      ..rattachementMcCoefficient = rattachementMcCoefficient ?? this.rattachementMcCoefficient
      ..rattachementMcId = rattachementMcId ?? this.rattachementMcId;
  }
}
