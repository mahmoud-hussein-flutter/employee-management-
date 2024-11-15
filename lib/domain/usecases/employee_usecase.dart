// lib/domain/usecases/employee_usecase.dart

import 'package:employee/data/models/employee_model.dart';
import 'package:employee/data/repositories/employee_repository.dart';
import 'package:employee/domain/entities/employee.dart';

class EmployeeUseCase {
  final EmployeeRepository repository;

  EmployeeUseCase(this.repository);

  Future<List<Employee>> getAllEmployees() async {
    // Fetches from the repository and converts each model to an entity
    final employees = await repository.getAllEmployees();
    return employees
        .map((model) => Employee(
              id: model.id,
              name: model.name,
              position: model.position,
              department: model.department,
            ))
        .toList();
  }

  Future<void> addEmployee(Employee employee) {
    // Converts entity to model before adding
    return repository.addEmployee(EmployeeModel(
      name: employee.name,
      position: employee.position,
      department: employee.department,
      businessCardImage: '',
      returnFromLeave: '',
      nationalIdImage: '',
      signedContract: '',
      qualifications: '',
      healthSpecialistCert: '',
      cprCourse: '',
      leaveRequest: '',
     
      businessCardExpirationDate: '', nationalIdExpirationDate: '', contractExpirationDate: '', qualificationsExpirationDate: '',  
 
      healthSpecialistCertExpirationDate: '',
      cprCourseExpirationDate: '', leaveRequestExpirationDate: '', returnFromLeaveExpirationDate: '', id: 1,
    ));
  }

  Future<void> updateEmployee(Employee updatedEmployee) {
    // Converts entity to model before updating
    return repository.updateEmployee(EmployeeModel(
      name: updatedEmployee.name,
      position: updatedEmployee.position,
      department: updatedEmployee.department,
      businessCardImage: '',
      returnFromLeave: '',
      nationalIdImage: '',
      signedContract: '',
      qualifications: '',
      healthSpecialistCert: '',
      cprCourse: '',
      leaveRequest: '',
     
      businessCardExpirationDate: '',
      nationalIdExpirationDate: '',
      contractExpirationDate: '',
      qualificationsExpirationDate: '',
      healthSpecialistCertExpirationDate: '',
      cprCourseExpirationDate: '', leaveRequestExpirationDate: '', returnFromLeaveExpirationDate: '', id: 2,
    ));
  }

  Future<void> deleteEmployee(int employeeId) =>
      repository.deleteEmployee(employeeId);
}
