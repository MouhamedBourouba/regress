import 'package:regress/data/models/student_data_entity.dart';

class Student {
  final String birthDate;
  final String lastName;
  final String firstName;
  final String birthPlace;

  const Student({
    required this.birthDate,
    required this.birthPlace,
    required this.firstName,
    required this.lastName,
  });

  /// Factory constructor to convert `StudentDataEntity` to `Student`
  factory Student.fromEntity(StudentDataEntity entity) {
    return Student(
      birthDate: entity.dateNaissance,
      lastName: entity.nomLatin,
      firstName: entity.prenomLatin,
      birthPlace: entity.lieuNaissance,
    );
  }
}
