class JwtToken {
  final DateTime expirationDate;
  final String token;

  JwtToken({required this.expirationDate, required this.token});
}

class Group {

}

class Student {
  final JwtToken jwtToken;
  final String uuid;
  final String registrationNumber;
  final String lastName;
  final String firstName;
  final String birthDate;
  final String birthPlace;
  final bool paidTransport;
  final bool paidInscription;
  final Major major;
  final University university;
  final List<Group> groups;

  Student({
    required this.uuid,
    required this.registrationNumber,
    required this.lastName,
    required this.firstName,
    required this.birthDate,
    required this.birthPlace,
    required this.major,
    required this.university,
    required this.paidTransport,
    required this.paidInscription,
    required this.groups,
    required this.jwtToken,
  });
}

class University {
  final String id;
  final String name;

  University({required this.id, required this.name});
}

class Major {
  final String domain;
  final String sector;
  final String level;
  final String levelId;

  Major({
    required this.domain,
    required this.sector,
    required this.level,
    required this.levelId,
  });
}
