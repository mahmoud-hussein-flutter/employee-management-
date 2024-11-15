import 'package:employee/data/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:employee/presentation/screens/home_page.dart';
import 'package:employee/presentation/screens/add_employee_page.dart';
import 'package:employee/presentation/screens/detail_page.dart';
import 'package:employee/presentation/screens/edit_employee_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Manager',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/addEmployee': (context) => const AddEmployeePage(),
        // Pass employee to EditEmployeePage, make sure to use the correct employee object.
        '/editEmployee': (context) => EditEmployeePage(employee: ModalRoute.of(context)!.settings.arguments as EmployeeModel),
        // Pass employee to DetailPage, make sure to use the correct employee object.
        '/detailEmployee': (context) => DetailPage(employee: ModalRoute.of(context)!.settings.arguments as EmployeeModel),
      },
      onGenerateRoute: (settings) {
        // Handling dynamic routes, for example for employee details
        if (settings.name == '/detailEmployee') {
          final employee = settings.arguments as EmployeeModel;
          return MaterialPageRoute(
            builder: (context) => DetailPage(employee: employee),
          );
        }
        return null;
      },
    );
  }
}
