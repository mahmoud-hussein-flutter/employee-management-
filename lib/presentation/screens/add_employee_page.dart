import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddEmployeePage extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers for each field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _businessCardController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _contractController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _specializationController = TextEditingController();
  final TextEditingController _cprCourseController = TextEditingController();
  final TextEditingController _leaveRequestController = TextEditingController();
  final TextEditingController _returnFromLeaveController = TextEditingController();

  // Expiration date controllers
  final TextEditingController _businessCardExpirationController = TextEditingController();
  final TextEditingController _nationalIdExpirationController = TextEditingController();
  final TextEditingController _contractExpirationController = TextEditingController();
  final TextEditingController _qualificationExpirationController = TextEditingController();
  final TextEditingController _specializationExpirationController = TextEditingController();
  final TextEditingController _cprCourseExpirationController = TextEditingController();
  final TextEditingController _leaveRequestExpirationController = TextEditingController();
  final TextEditingController _returnFromLeaveExpirationController = TextEditingController();

  // Function to pick a file
  Future<void> _pickFile(TextEditingController controller) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        controller.text = result.files.single.name;
      });
    }
  }

  // Builds a text field with icons and validation
  Widget _buildTextField(String label, IconData prefixIcon, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon, color: Colors.blueAccent),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[100],
        labelStyle: TextStyle(color: Colors.blueGrey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  // Builds a file picker field with an expiration date field
  Widget _buildFilePicker(String label, IconData prefixIcon, TextEditingController controller, TextEditingController expirationController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _pickFile(controller),
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(prefixIcon, color: Colors.blueAccent),
                suffixIcon: Icon(Icons.attach_file, color: Colors.blueAccent),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[100],
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'File is required';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: expirationController,
          decoration: InputDecoration(
            labelText: '$label Expiration Date',
            prefixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.grey[100],
            labelStyle: TextStyle(color: Colors.blueGrey),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Expiration date is required';
            }
            return null;
          },
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              expirationController.text = "${date.day}/${date.month}/${date.year}";
            }
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Employee',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField("Employee Name", Icons.person, _nameController),
                SizedBox(height: 15),
                _buildTextField("Job Title", Icons.work, _positionController),
                SizedBox(height: 15),
                _buildTextField("Department", Icons.business, _departmentController),
                SizedBox(height: 20),

                // Document Upload Fields with Expiration Dates
                _buildFilePicker("Business Card Image", Icons.business, _businessCardController, _businessCardExpirationController),
                _buildFilePicker("National ID Image", Icons.card_membership, _nationalIdController, _nationalIdExpirationController),
                _buildFilePicker("Signed Contract", Icons.description, _contractController, _contractExpirationController),
                _buildFilePicker("Qualifications", Icons.school, _qualificationController, _qualificationExpirationController),
                _buildFilePicker("Health Specialist Certification", Icons.local_hospital, _specializationController, _specializationExpirationController),
                _buildFilePicker("CPR Course", Icons.fitness_center, _cprCourseController, _cprCourseExpirationController),
                _buildFilePicker("Leave Request", Icons.request_page, _leaveRequestController, _leaveRequestExpirationController),
                _buildFilePicker("Return from Leave", Icons.calendar_today, _returnFromLeaveController, _returnFromLeaveExpirationController),
                SizedBox(height: 20),

                // Submit Button with Password Prompt
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showPasswordDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    'Add Employee',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to display password dialog before submitting
  void _showPasswordDialog(BuildContext context) {
    final passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Password"),
          content: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.lock, color: Colors.blueGrey),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[100],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (passwordController.text == "987654321") {
                  // Proceed to add the employee
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Employee added successfully!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Incorrect password. Try again.")),
                  );
                }
              },
              child: Text("Submit", style: TextStyle(color: Colors.blueGrey)),
            ),
          ],
        );
      },
    );
  }
}
