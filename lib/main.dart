import 'package:employee/domain/usecases/employee_usecase.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employee/presentation/cubits/employee_cubit.dart';
import 'package:employee/data/repositories/employee_repository.dart';
import 'package:employee/presentation/screens/home_page.dart';
import 'package:employee/presentation/screens/add_employee_page.dart';

void main() {
  final employeeRepository = EmployeeRepository();
  final employeeUseCase = EmployeeUseCase(employeeRepository);
  runApp(MyApp(employeeUseCase));
}

class MyApp extends StatelessWidget {
  final EmployeeUseCase employeeUseCase;

  const MyApp(this.employeeUseCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmployeeCubit(employeeUseCase),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee Manager',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
        routes: {
          '/addEmployee': (context) => AddEmployeePage(),
        },
      ),
    );
  }
}
