// lib/presentation/screens/edit_employee_page.dart

import 'package:employee/data/models/employee_model.dart';
import 'package:flutter/material.dart';

class EditEmployeePage extends StatelessWidget {
  final EmployeeModel employee; // Accepting EmployeeModel here

  // Constructor now accepts the employee argument
  const EditEmployeePage({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit employee details for: ${employee.name}'),
            // Add your form fields and logic to update employee details here.
          ],
        ),
      ),
    );
  }
}
