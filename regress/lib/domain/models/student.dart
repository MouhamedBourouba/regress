import 'dart:convert';

import 'package:regress/domain/models/major.dart';

class Student {
  final String registrationNumber;
  final String lastName;
  final String firstName;
  final String birthDate;
  final String birthPlace;
  final bool paidTransport;
  final bool paidInscription;
  final Major major;
  final String universityName;

  Student({
    required this.registrationNumber,
    required this.lastName,
    required this.firstName,
    required this.birthDate,
    required this.birthPlace,
    required this.major,
    required this.universityName,
    required this.paidTransport,
    required this.paidInscription,
  });

  Map<String, dynamic> toJson() {
    return {
      'registrationNumber': registrationNumber,
      'lastName': lastName,
      'firstName': firstName,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'paidTransport': paidTransport,
      'paidInscription': paidInscription,
      'major': major.toString(),
      'universityName': universityName,
    };
  }

  factory Student.fromJson(Map<String, dynamic> map) {
    return Student(
      registrationNumber: map['registrationNumber'],
      lastName: map['lastName'],
      firstName: map['firstName'],
      birthDate: map['birthDate'],
      birthPlace: map['birthPlace'],
      paidTransport: map['paidTransport'],
      paidInscription: map['paidInscription'],
      major: Major.fromJson(jsonDecode(map["major"])),
      universityName: map['universityName'],
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}


