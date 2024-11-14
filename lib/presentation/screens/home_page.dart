// lib/presentation/screens/home_page.dart

import 'package:employee/presentation/screens/add_employee_page.dart';
import 'package:flutter/material.dart';
import 'package:employee/data/models/employee_model.dart';
import 'package:employee/presentation/screens/detail_page.dart'; // Assuming you have a DetailPage

class HomePage extends StatelessWidget {
  // Sample Employee data (can be fetched from an API or local database)
  final List<EmployeeModel> employees = [
    EmployeeModel(
      id: 1,
      name: 'Ahmed Ali',
      position: 'Software Engineer',
      department: 'IT Department',
      businessCardImage: 'link_to_card_image',  // Removed Image
      nationalIdImage: 'link_to_national_id_image',
      signedContract: 'link_to_contract',
      qualifications: 'link_to_qualifications',
      healthSpecialistCert: 'link_to_cert',
      cprCourse: 'link_to_cpr',
      leaveRequest: 'link_to_leave_request',
      returnFromLeave: 'link_to_return_from_leave',
    ),
    EmployeeModel(
      id: 2,
      name: 'Sara Hassan',
      position: 'Product Manager',
      department: 'Product',
      businessCardImage: 'link_to_card_image',  // Removed Image
      nationalIdImage: 'link_to_national_id_image',
      signedContract: 'link_to_contract',
      qualifications: 'link_to_qualifications',
      healthSpecialistCert: 'link_to_cert',
      cprCourse: 'link_to_cpr',
      leaveRequest: 'link_to_leave_request',
      returnFromLeave: 'link_to_return_from_leave',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Manager', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: employees.length,
          itemBuilder: (context, index) {
            final employee = employees[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.account_circle,  // Icon instead of Image
                  size: 50,
                  color: Colors.blueGrey,  // Icon color
                ),
                title: Text(
                  employee.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${employee.position}\n${employee.department}',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
                onTap: () {
                  // Navigate to the employee detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(employee: employee),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEmployeePage()),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
