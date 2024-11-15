// lib/presentation/cubits/employee_cubit.dart

import 'package:employee/data/models/employee_model.dart';
import 'package:employee/domain/entities/employee.dart';
import 'package:employee/domain/usecases/employee_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_state.dart'; // Import EmployeeModel

class EmployeeCubit extends Cubit<EmployeeState> {
  final EmployeeUseCase _employeeUseCase;

  EmployeeCubit(this._employeeUseCase) : super(EmployeeInitial());

  // Fetch employees
  Future<void> fetchEmployees() async {
    try {
      emit(EmployeeLoading());
      final employees = await _employeeUseCase.getAllEmployees();

      // Cast the List<Employee> to List<EmployeeModel>
      final employeeModels = employees.map((e) => e as EmployeeModel).toList();

      emit(EmployeeLoaded(employeeModels));
    } catch (e) {
      emit(EmployeeError("Failed to load employees"));
    }
  }

  // Add employee
  Future<void> addEmployee(EmployeeModel employee) async {
    try {
      emit(EmployeeLoading());
      await _employeeUseCase.addEmployee(employee as Employee);
      emit(EmployeeAdded(employee));
    } catch (e) {
      emit(EmployeeError("Failed to add employee"));
    }
  }

  // Update employee
  Future<void> updateEmployee(EmployeeModel employee) async {
    try {
      emit(EmployeeLoading());
      await _employeeUseCase.updateEmployee(employee as Employee);
      emit(EmployeeUpdated(employee));
    } catch (e) {
      emit(EmployeeError("Failed to update employee"));
    }
  }

  // Delete employee
  Future<void> deleteEmployee(int employeeId) async {
    try {
      emit(EmployeeLoading());
      await _employeeUseCase.deleteEmployee(employeeId);
      emit(EmployeeDeleted(employeeId));
    } catch (e) {
      emit(EmployeeError("Failed to delete employee"));
    }
  }
}
