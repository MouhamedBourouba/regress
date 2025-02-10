import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/student_data_entity.dart';

StudentDataEntity $StudentDataEntityFromJson(Map<String, dynamic> json) {
  final StudentDataEntity studentDataEntity = StudentDataEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    studentDataEntity.id = id;
  }
  final String? dateNaissance = jsonConvert.convert<String>(json['dateNaissance']);
  if (dateNaissance != null) {
    studentDataEntity.dateNaissance = dateNaissance;
  }
  final String? nomArabe = jsonConvert.convert<String>(json['nomArabe']);
  if (nomArabe != null) {
    studentDataEntity.nomArabe = nomArabe;
  }
  final String? nomLatin = jsonConvert.convert<String>(json['nomLatin']);
  if (nomLatin != null) {
    studentDataEntity.nomLatin = nomLatin;
  }
  final String? prenomArabe = jsonConvert.convert<String>(json['prenomArabe']);
  if (prenomArabe != null) {
    studentDataEntity.prenomArabe = prenomArabe;
  }
  final String? prenomLatin = jsonConvert.convert<String>(json['prenomLatin']);
  if (prenomLatin != null) {
    studentDataEntity.prenomLatin = prenomLatin;
  }
  final String? lieuNaissance = jsonConvert.convert<String>(json['lieuNaissance']);
  if (lieuNaissance != null) {
    studentDataEntity.lieuNaissance = lieuNaissance;
  }
  final String? lieuNaissanceArabe = jsonConvert.convert<String>(json['lieuNaissanceArabe']);
  if (lieuNaissanceArabe != null) {
    studentDataEntity.lieuNaissanceArabe = lieuNaissanceArabe;
  }
  return studentDataEntity;
}

Map<String, dynamic> $StudentDataEntityToJson(StudentDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['dateNaissance'] = entity.dateNaissance;
  data['nomArabe'] = entity.nomArabe;
  data['nomLatin'] = entity.nomLatin;
  data['prenomArabe'] = entity.prenomArabe;
  data['prenomLatin'] = entity.prenomLatin;
  data['lieuNaissance'] = entity.lieuNaissance;
  data['lieuNaissanceArabe'] = entity.lieuNaissanceArabe;
  return data;
}

extension StudentDataEntityExtension on StudentDataEntity {
  StudentDataEntity copyWith({
    int? id,
    String? dateNaissance,
    String? nomArabe,
    String? nomLatin,
    String? prenomArabe,
    String? prenomLatin,
    String? lieuNaissance,
    String? lieuNaissanceArabe,
  }) {
    return StudentDataEntity()
      ..id = id ?? this.id
      ..dateNaissance = dateNaissance ?? this.dateNaissance
      ..nomArabe = nomArabe ?? this.nomArabe
      ..nomLatin = nomLatin ?? this.nomLatin
      ..prenomArabe = prenomArabe ?? this.prenomArabe
      ..prenomLatin = prenomLatin ?? this.prenomLatin
      ..lieuNaissance = lieuNaissance ?? this.lieuNaissance
      ..lieuNaissanceArabe = lieuNaissanceArabe ?? this.lieuNaissanceArabe;
  }
}