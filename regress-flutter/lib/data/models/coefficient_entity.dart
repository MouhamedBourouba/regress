import 'package:regress/domain/models/module_coefficient.dart';

class CoefficientEntity {
  final double coefficientControleContinu;
  final double coefficientControleIntermediaire;
  final double coefficientExamen;
  final String mcLibelleAr;
  final String mcLibelleFr;
  final String periodeLibelleAr;
  final String periodeLibelleFr;

  CoefficientEntity({
    required this.coefficientControleContinu,
    required this.coefficientControleIntermediaire,
    required this.coefficientExamen,
    required this.mcLibelleAr,
    required this.mcLibelleFr,
    required this.periodeLibelleAr,
    required this.periodeLibelleFr,
  });

  factory CoefficientEntity.fromJson(Map<String, dynamic> json) {
    return CoefficientEntity(
      coefficientControleContinu: json['coefficientControleContinu']?.toDouble() ?? 0.0,
      coefficientControleIntermediaire: json['coefficientControleIntermediaire']?.toDouble() ?? 0.0,
      coefficientExamen: json['coefficientExamen']?.toDouble() ?? 0.0,
      mcLibelleAr: json['mcLibelleAr'] ?? '',
      mcLibelleFr: json['mcLibelleFr'] ?? '',
      periodeLibelleAr: json['periodeLibelleAr'] ?? '',
      periodeLibelleFr: json['periodeLibelleFr'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coefficientControleContinu': coefficientControleContinu,
      'coefficientControleIntermediaire': coefficientControleIntermediaire,
      'coefficientExamen': coefficientExamen,
      'mcLibelleAr': mcLibelleAr,
      'mcLibelleFr': mcLibelleFr,
      'periodeLibelleAr': periodeLibelleAr,
      'periodeLibelleFr': periodeLibelleFr,
    };
  }

  ModuleCoefficient toModuleCoefficient() {
    return ModuleCoefficient(
      continuousAssessmentCoefficient: coefficientControleContinu,
      midtermExamCoefficient: coefficientControleIntermediaire,
      finalExamCoefficient: coefficientExamen,
      moduleNameArabic: mcLibelleAr,
      moduleNameFrench: mcLibelleFr,
      semesterNameArabic: periodeLibelleAr,
      semesterNameFrench: periodeLibelleFr,
    );
  }
}
