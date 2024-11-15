// ignore_for_file: library_private_types_in_public_api

import 'package:employee/presentation/screens/add_employee_page.dart';
import 'package:flutter/material.dart';
import 'package:employee/data/models/employee_model.dart';
import 'package:employee/presentation/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample Employee data (can be fetched from an API or local database)
  final List<EmployeeModel> employees = [
    EmployeeModel(
      id: 1,
      name: 'Ahmed Ali',
      position: 'Software Engineer',
      department: 'IT Department',
      businessCardImage: 'link_to_card_image',
      nationalIdImage: 'link_to_national_id_image',
      signedContract: 'link_to_contract',
      qualifications: 'link_to_qualifications',
      healthSpecialistCert: 'link_to_cert',
      cprCourse: 'link_to_cpr',
      leaveRequest: 'link_to_leave_request',
      returnFromLeave: 'link_to_return_from_leave',
     
      businessCardExpirationDate: '',
      nationalIdExpirationDate: '',
      contractExpirationDate: '',
      qualificationsExpirationDate: '',
      healthSpecialistCertExpirationDate: '',
      cprCourseExpirationDate: '',
      leaveRequestExpirationDate: '',
      returnFromLeaveExpirationDate: '',
    ),
    EmployeeModel(
      id: 2,
      name: 'Sara Hassan',
      position: 'Product Manager',
      department: 'Product',
      businessCardImage: 'link_to_card_image',
      nationalIdImage: 'link_to_national_id_image',
      signedContract: 'link_to_contract',
      qualifications: 'link_to_qualifications',
      healthSpecialistCert: 'link_to_cert',
      cprCourse: 'link_to_cpr',
      leaveRequest: 'link_to_leave_request',
      returnFromLeave: 'link_to_return_from_leave',
     
      businessCardExpirationDate: '',
      nationalIdExpirationDate: '',
      contractExpirationDate: '',
      qualificationsExpirationDate: '',
      healthSpecialistCertExpirationDate: '',
      cprCourseExpirationDate: '',
      leaveRequestExpirationDate: '',
      returnFromLeaveExpirationDate: '',
    ),
  ];

  List<EmployeeModel> filteredEmployees = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEmployees = employees;

    // Listen to search input changes
    _searchController.addListener(() {
      filterEmployees();
    });
  }

  // Filter employees based on search term
  void filterEmployees() {
    setState(() {
      String searchTerm = _searchController.text.toLowerCase();
      filteredEmployees = employees.where((employee) {
        return employee.name.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Manager',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Name',
                prefixIcon: const Icon(Icons.search, color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),

            // List of Employees
            Expanded(
              child: ListView.builder(
                itemCount: filteredEmployees.length,
                itemBuilder: (context, index) {
                  final employee = filteredEmployees[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        employee.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${employee.position}\n${employee.department}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing:
                          const Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(employee: employee),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
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
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
