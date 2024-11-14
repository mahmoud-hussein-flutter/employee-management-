// lib/data/models/employee_model.dart

class EmployeeModel {
  final int id;
  final String name;
  final String position;
  final String department;
  final String businessCardImage;
  final String nationalIdImage;
  final String signedContract;
  final String qualifications;
  final String healthSpecialistCert;
  final String cprCourse;
  final String leaveRequest;
  final String returnFromLeave;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.position,
    required this.department,
    required this.businessCardImage,
    required this.nationalIdImage,
    required this.signedContract,
    required this.qualifications,
    required this.healthSpecialistCert,
    required this.cprCourse,
    required this.leaveRequest,
    required this.returnFromLeave, required String businessCardExpiration, required String nationalIdExpiration, required String contractExpiration, required String qualificationExpiration, required String specializationExpiration, required String cprCourseExpiration, required String leaveRequestExpiration, required String returnFromLeaveExpiration,
  });
}
