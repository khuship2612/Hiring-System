import 'package:flutter/material.dart';

void main() {
  runApp(
    Scaffold()
  );
}

class RegistrationFormPage extends StatefulWidget {
  @override
  _RegistrationFormPageState createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobDescController = TextEditingController();

  String? selectedProfession;
  String? selectedQualification;

  final Map<String, List<String>> professionOptions = {
    'Technical': ['BE', 'BTECH', 'ME', 'MTECH'],
    'Management': ['MBA', 'PGDM', 'BBA'],
    'Strategic': ['Strategy Analyst', 'Business Planner'],
    'Certified Profession': ['CA', 'CS', 'CFA', 'CPA'],
    'Common Profession': ['Teacher', 'Clerk', 'Sales Executive'],
  };

  List<String> getQualificationOptions() {
    return selectedProfession != null
        ? professionOptions[selectedProfession] ?? []
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: jobTitleController,
              decoration: InputDecoration(
                labelText: 'Job Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: jobDescController,
              decoration: InputDecoration(
                labelText: 'Job Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedProfession,
              decoration: InputDecoration(
                labelText: 'Select Profession',
                border: OutlineInputBorder(),
              ),
              items: professionOptions.keys
                  .map((profession) => DropdownMenuItem<String>(
                value: profession,
                child: Text(profession),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedProfession = value;
                  selectedQualification = null; // reset qualification
                });
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedQualification,
              decoration: InputDecoration(
                labelText: 'Select Qualification',
                border: OutlineInputBorder(),
              ),
              items: getQualificationOptions()
                  .map((qualification) => DropdownMenuItem<String>(
                value: qualification,
                child: Text(qualification),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedQualification = value;
                });
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Example submit logic
                if (jobTitleController.text.isNotEmpty &&
                    jobDescController.text.isNotEmpty &&
                    selectedProfession != null &&
                    selectedQualification != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Submitted Successfully!'),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please fill all the fields.'),
                  ));
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
