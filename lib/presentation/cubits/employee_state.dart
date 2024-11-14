// lib/presentation/cubits/employee_state.dart

part of 'employee_cubit.dart';

abstract class EmployeeState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeModel> employees;

  EmployeeLoaded(this.employees);

  @override
  List<Object> get props => [employees];
}

class EmployeeAdded extends EmployeeState {
  final EmployeeModel employee;

  EmployeeAdded(this.employee);

  @override
  List<Object> get props => [employee];
}

class EmployeeUpdated extends EmployeeState {
  final EmployeeModel employee;

  EmployeeUpdated(this.employee);

  @override
  List<Object> get props => [employee];
}

class EmployeeDeleted extends EmployeeState {
  final int employeeId;

  EmployeeDeleted(this.employeeId);

  @override
  List<Object> get props => [employeeId];
}

class EmployeeError extends EmployeeState {
  final String message;

  EmployeeError(this.message);

  @override
  List<Object> get props => [message];
}
