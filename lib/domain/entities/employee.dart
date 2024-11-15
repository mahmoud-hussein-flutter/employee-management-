// lib/domain/entities/employee.dart

import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String position;
  final String department;
  final String? businessCardPath;
  final String? nationalIdPath;
  final String? contractPath;
  final String? qualificationPath;
  final String? specializationPath;
  final String? cprPath;
  final String? leaveRequestPath;
  final String? postLeavePath;

  const Employee({
    required this.id,
    required this.name,
    required this.position,
    required this.department,
    this.businessCardPath,
    this.nationalIdPath,
    this.contractPath,
    this.qualificationPath,
    this.specializationPath,
    this.cprPath,
    this.leaveRequestPath,
    this.postLeavePath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        position,
        department,
        businessCardPath,
        nationalIdPath,
        contractPath,
        qualificationPath,
        specializationPath,
        cprPath,
        leaveRequestPath,
        postLeavePath,
      ];
}
