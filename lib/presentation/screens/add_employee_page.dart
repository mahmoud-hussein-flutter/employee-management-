// lib/presentation/screens/add_employee_page.dart

import 'package:flutter/material.dart';

class AddEmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Employee'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fill in the details to add a new employee:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Form fields for adding employee details
            // Example:
            TextFormField(
              decoration: InputDecoration(labelText: 'Employee Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Position'),
            ),
            // Add more fields for other employee details...
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle add employee logic here
                print('Employee added');
                Navigator.pop(context); // Navigate back to the home page after adding
              },
              child: Text('Add Employee'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
