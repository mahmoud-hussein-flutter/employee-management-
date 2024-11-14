import 'package:employee/domain/entities/employee.dart';

abstract class EmployeeRepositoryInterface {
  Future<List<Employee>> getAllEmployees();
  Future<void> addEmployee(Employee employee);
}
