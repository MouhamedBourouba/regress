import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/student_data_entity.dart';

StudentDataEntity $StudentDataEntityFromJson(Map<String, dynamic> json) {
  final StudentDataEntity studentDataEntity = StudentDataEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    studentDataEntity.id = id;
  }
  final String? identifiant = jsonConvert.convert<String>(json['identifiant']);
  if (identifiant != null) {
    studentDataEntity.identifiant = identifiant;
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
  final String? photo = jsonConvert.convert<String>(json['photo']);
  if (photo != null) {
    studentDataEntity.photo = photo;
  }
  final dynamic email = json['email'];
  if (email != null) {
    studentDataEntity.email = email;
  }
  final String? idCarde = jsonConvert.convert<String>(json['idCarde']);
  if (idCarde != null) {
    studentDataEntity.idCarde = idCarde;
  }
  return studentDataEntity;
}

Map<String, dynamic> $StudentDataEntityToJson(StudentDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['identifiant'] = entity.identifiant;
  data['dateNaissance'] = entity.dateNaissance;
  data['nomArabe'] = entity.nomArabe;
  data['nomLatin'] = entity.nomLatin;
  data['prenomArabe'] = entity.prenomArabe;
  data['prenomLatin'] = entity.prenomLatin;
  data['lieuNaissance'] = entity.lieuNaissance;
  data['lieuNaissanceArabe'] = entity.lieuNaissanceArabe;
  data['photo'] = entity.photo;
  data['email'] = entity.email;
  data['idCarde'] = entity.idCarde;
  return data;
}

extension StudentDataEntityExtension on StudentDataEntity {
  StudentDataEntity copyWith({
    int? id,
    String? identifiant,
    String? dateNaissance,
    String? nomArabe,
    String? nomLatin,
    String? prenomArabe,
    String? prenomLatin,
    String? lieuNaissance,
    String? lieuNaissanceArabe,
    String? photo,
    dynamic email,
    String? idCarde,
  }) {
    return StudentDataEntity()
      ..id = id ?? this.id
      ..identifiant = identifiant ?? this.identifiant
      ..dateNaissance = dateNaissance ?? this.dateNaissance
      ..nomArabe = nomArabe ?? this.nomArabe
      ..nomLatin = nomLatin ?? this.nomLatin
      ..prenomArabe = prenomArabe ?? this.prenomArabe
      ..prenomLatin = prenomLatin ?? this.prenomLatin
      ..lieuNaissance = lieuNaissance ?? this.lieuNaissance
      ..lieuNaissanceArabe = lieuNaissanceArabe ?? this.lieuNaissanceArabe
      ..photo = photo ?? this.photo
      ..email = email ?? this.email
      ..idCarde = idCarde ?? this.idCarde;
  }
}