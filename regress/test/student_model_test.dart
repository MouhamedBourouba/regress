import 'package:flutter_test/flutter_test.dart';
import 'package:regress/domain/models/major.dart';
import 'package:regress/domain/models/student.dart';

void main() {
  group('Major', () {
    test('toJson and fromJson should work correctly', () {
      final major = Major(
        domain: "Science",
        sector: "Computer Science",
        level: "Bachelor",
      );

      final json = major.toJson();
      final newMajor = Major.fromJson(json);

      expect(newMajor.domain, major.domain);
      expect(newMajor.sector, major.sector);
      expect(newMajor.level, major.level);
    });
  });

  group('Student', () {
    test('toJson and fromJson should work correctly', () {
      final student = Student(
        registrationNumber: "12345",
        lastName: "Doe",
        firstName: "John",
        birthDate: "2000-01-01",
        birthPlace: "New York",
        major: Major(
          domain: "Science",
          sector: "Computer Science",
          level: "Bachelor",
        ),
        universityName: "Tech University",
      );

      final json = student.toJson();
      final newStudent = Student.fromJson(json);

      expect(newStudent.registrationNumber, student.registrationNumber);
      expect(newStudent.lastName, student.lastName);
      expect(newStudent.firstName, student.firstName);
      expect(newStudent.birthDate, student.birthDate);
      expect(newStudent.birthPlace, student.birthPlace);
      expect(newStudent.universityName, student.universityName);

      expect(newStudent.major.domain, student.major.domain);
      expect(newStudent.major.sector, student.major.sector);
      expect(newStudent.major.level, student.major.level);
    });
  });
}
