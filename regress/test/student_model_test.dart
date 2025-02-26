import 'package:flutter_test/flutter_test.dart';
import 'package:regress/domain/models/group.dart';
import 'package:regress/domain/models/major.dart';
import 'package:regress/domain/models/student.dart';

void main() {
  group('Major', () {
    test('toJson and fromJson should work correctly', () {
      final major = Major(
        domain: "Science",
        sector: "Computer Science",
        level: "Bachelor",
        levelId: "CS101",
      );

      final json = major.toJson();
      final newMajor = Major.fromJson(json);

      expect(newMajor.domain, major.domain);
      expect(newMajor.sector, major.sector);
      expect(newMajor.level, major.level);
      expect(newMajor.levelId, major.levelId);
    });
  });

  group('Group', () {
    test('toJson and fromJson should work correctly', () {
      final group = Group(number: "1", section: "A");

      final json = group.toJson();
      final newGroup = Group.fromJson(json);

      expect(newGroup.number, group.number);
      expect(newGroup.section, group.section);
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
        paidTransport: true,
        paidInscription: false,
        major: Major(
          domain: "Science",
          sector: "Computer Science",
          level: "Bachelor",
          levelId: "CS101",
        ),
        universityName: "Tech University",
        groups: [
          Group(number: "1", section: "A"),
          Group(number: "2", section: "B"),
        ],
      );

      final json = student.toJson();
      final newStudent = Student.fromJson(json);

      expect(newStudent.registrationNumber, student.registrationNumber);
      expect(newStudent.lastName, student.lastName);
      expect(newStudent.firstName, student.firstName);
      expect(newStudent.birthDate, student.birthDate);
      expect(newStudent.birthPlace, student.birthPlace);
      expect(newStudent.paidTransport, student.paidTransport);
      expect(newStudent.paidInscription, student.paidInscription);
      expect(newStudent.universityName, student.universityName);

      expect(newStudent.major.domain, student.major.domain);
      expect(newStudent.major.sector, student.major.sector);
      expect(newStudent.major.level, student.major.level);
      expect(newStudent.major.levelId, student.major.levelId);

      expect(newStudent.groups.length, student.groups.length);
      for (int i = 0; i < student.groups.length; i++) {
        expect(newStudent.groups[i].number, student.groups[i].number);
        expect(newStudent.groups[i].section, student.groups[i].section);
      }
    });
  });
}