import 'package:regress/domain/models/exam_notes.dart';
import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/student_notes_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/student_notes_entity.g.dart';

@JsonSerializable()
class StudentNotesEntity {
  late bool autorisationDemandeRecours = false;
  late String dateDebutDepotRecours = '';
  late String dateLimiteDepotRecours = '';
  late double id;
  late double idPeriode;
  @JSONField(name: 'id_dia')
  late double idDia;
  late String mcLibelleAr = '';
  late String mcLibelleFr = '';
  late double noteExamen;
  late double planningSessionId;
  late String planningSessionIntitule = '';
  late double rattachementMcCoefficient;
  late double rattachementMcId;

  StudentNotesEntity();

  factory StudentNotesEntity.fromJson(Map<String, dynamic> json) =>
      $StudentNotesEntityFromJson(json);

  Map<String, dynamic> toJson() => $StudentNotesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ExamNotes toNotes() =>
      ExamNotes(subject: mcLibelleFr, coefficient: rattachementMcCoefficient, grade: noteExamen);
}
