class EmployeeModel {
  final String name;
  final String position;
  final String department;
  final String businessCardImage;
  final String businessCardExpirationDate;
  final String nationalIdImage;
  final String nationalIdExpirationDate;
  final String signedContract;
  final String contractExpirationDate;
  final String qualifications;
  final String qualificationsExpirationDate;
  final String healthSpecialistCert;
  final String healthSpecialistCertExpirationDate;
  final String cprCourse;
  final String cprCourseExpirationDate;
  final String leaveRequest;
  final String leaveRequestExpirationDate;
  final String returnFromLeave;
  final String returnFromLeaveExpirationDate;

  EmployeeModel({
    required this.name,
    required this.position,
    required this.department,
    required this.businessCardImage,
    required this.businessCardExpirationDate,
    required this.nationalIdImage,
    required this.nationalIdExpirationDate,
    required this.signedContract,
    required this.contractExpirationDate,
    required this.qualifications,
    required this.qualificationsExpirationDate,
    required this.healthSpecialistCert,
    required this.healthSpecialistCertExpirationDate,
    required this.cprCourse,
    required this.cprCourseExpirationDate,
    required this.leaveRequest,
    required this.leaveRequestExpirationDate,
    required this.returnFromLeave,
    required this.returnFromLeaveExpirationDate, required int id,
  });

  get id => null;
}
