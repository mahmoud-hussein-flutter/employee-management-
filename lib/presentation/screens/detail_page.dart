// lib/presentation/screens/detail_page.dart

import 'package:flutter/material.dart';
import 'package:employee/data/models/employee_model.dart';

class DetailPage extends StatelessWidget {
  final EmployeeModel employee;

  DetailPage({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Employee Personal Info Section
              _buildSectionTitle('Personal Information'),
              _buildInfoRow('Name', employee.name),
              _buildInfoRow('Position', employee.position),
              _buildInfoRow('Department', employee.department),
              SizedBox(height: 20),

              Divider(color: Colors.blueGrey, thickness: 1.2),
              SizedBox(height: 20),

              // Employee Documents Section
              _buildSectionTitle('Documents'),
              _buildDocumentRow('Business Card', Icons.business, employee.businessCardImage),
              _buildDocumentRow('National ID', Icons.card_membership, employee.nationalIdImage),
              _buildDocumentRow('Signed Contract', Icons.description, employee.signedContract),
              _buildDocumentRow('Qualifications', Icons.school, employee.qualifications),
              _buildDocumentRow('Health Specialist Certification', Icons.local_hospital, employee.healthSpecialistCert),
              _buildDocumentRow('CPR Course', Icons.fitness_center, employee.cprCourse),
              _buildDocumentRow('Leave Request', Icons.request_page, employee.leaveRequest),
              _buildDocumentRow('Return from Leave', Icons.calendar_today, employee.returnFromLeave),
              SizedBox(height: 20),
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
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[700]),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.blueGrey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentRow(String title, IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[700], size: 30),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Open the document or image
              print("Opening $title");
              // Here you would open the document in your app
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blueGrey,
            ),
            child: Text('View'),
          ),
        ],
      ),
    );
  }
}
