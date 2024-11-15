import 'package:flutter/material.dart';
import 'package:employee/data/models/employee_model.dart';
import 'package:employee/presentation/screens/edit_employee_page.dart';

class DetailPage extends StatelessWidget {
  final EmployeeModel employee;

  const DetailPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Personal Information'),
              _buildInfoRow('Name', employee.name),
              _buildInfoRow('Position', employee.position),
              _buildInfoRow('Department', employee.department),
              const SizedBox(height: 20),
              const Divider(color: Colors.blueGrey, thickness: 1.2),
              const SizedBox(height: 20),
              _buildSectionTitle('Documents'),
              _buildDocumentRow('Business Card', Icons.business,
                  employee.businessCardImage, '2025-12-31'),
              _buildDocumentRow('National ID', Icons.card_membership,
                  employee.nationalIdImage, '2026-06-30'),
              _buildDocumentRow('Signed Contract', Icons.description,
                  employee.signedContract, '2027-04-15'),
              _buildDocumentRow('Qualifications', Icons.school,
                  employee.qualifications, '2026-11-01'),
              _buildDocumentRow(
                  'Health Specialist Certification',
                  Icons.local_hospital,
                  employee.healthSpecialistCert,
                  '2027-05-20'),
              _buildDocumentRow('CPR Course', Icons.fitness_center,
                  employee.cprCourse, '2025-08-18'),
              _buildDocumentRow('Leave Request', Icons.request_page,
                  employee.leaveRequest, '2024-12-20'),
              _buildDocumentRow('Return from Leave', Icons.calendar_today,
                  employee.returnFromLeave, '2024-12-31'),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Edit Employee Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditEmployeePage(employee: employee),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: const Text(
                    'Edit Employee',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[800],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blueGrey[700]),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.blueGrey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentRow(
      String title, IconData icon, String url, String expirationDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[700], size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle document view logic here
              print("Opening $title");
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey),
            child: const Text('View'),
          ),
          const SizedBox(width: 16),
          Text(
            'Expires: $expirationDate',
            style: TextStyle(color: Colors.blueGrey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
