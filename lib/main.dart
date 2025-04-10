import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship/addjob.dart';
import 'package:internship/homepage.dart';
import 'package:internship/logozoominpage.dart';
import 'package:internship/phoneauth.dart';
import 'package:internship/postedjob.dart';
import 'package:internship/profilelist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LogoZoomInPage(),
        '/homepage': (context) => Homepage(),
        '/register': (context) => FormPage(),
        '/login': (context) => LoginPage(),
        '/list': (context) => Profilelist(),
        '/profilelist': (context) => ProfileListPage(),
        '/postedjob': (context) => postedjob(),
        '/addjob': (context) => RegistrationFormPage(), // Ensure this exists
      },
    );
  }
}

class Student {
  final String name;
  final String email;
  final String role;
  final String qualification;
  final String experience;
  final String designation;
  final String locationPreferences;
  final String companyAddress; // Either "Employee" or "Employer"

  Student(
      {required this.name,
        required this.email,
        required this.role,
        required this.qualification,
        required this.experience,
        required this.designation,
        required this.locationPreferences,
        required this.companyAddress});
}

// Global list to hold all registered profiles.
List<Student> studentList = [];

// Global variable to store the current user's role.
String? currentUserRole;

class Profilelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profiles',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final Student student = settings.arguments as Student;
          return MaterialPageRoute(
            builder: (context) => StudentProfilePage(student: student),
          );
        }
        return null;
      },
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController locationPreferencesController =
  TextEditingController();
  final TextEditingController companyAddressController =
  TextEditingController();
  String _selectedRole = 'Employee';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    qualificationController.dispose();
    experienceController.dispose();
    designationController.dispose();
    locationPreferencesController.dispose();
    companyAddressController.dispose();
    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      Student newStudent = Student(
        name: nameController.text,
        email: emailController.text,
        qualification: qualificationController.text,
        experience: experienceController.text,
        designation: designationController.text,
        locationPreferences: locationPreferencesController.text,
        companyAddress: companyAddressController.text,
        role: _selectedRole,
      );

      studentList.add(newStudent);
      currentUserRole = _selectedRole;

      // Navigate to profile list page
      Navigator.pushNamed(context, '/profilelist');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter your name'
                  : null,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter your email'
                  : null,
            ),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Number'),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter your number'
                  : null,
            ),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: InputDecoration(labelText: 'Role'),
              items: ['Employee', 'Employer'].map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            if (_selectedRole == 'Employee') ...[
              TextFormField(
                controller: qualificationController,
                decoration: InputDecoration(labelText: 'Qualification'),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter your qualification'
                    : null,
              ),
              TextFormField(
                controller: experienceController,
                decoration: InputDecoration(labelText: 'Experience'),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter your experience'
                    : null,
              ),
              TextFormField(
                controller: designationController,
                decoration: InputDecoration(labelText: 'Designation'),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter your designation'
                    : null,
              ),
              TextFormField(
                controller: locationPreferencesController,
                decoration: InputDecoration(labelText: 'Location Preferences'),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter location preferences'
                    : null,
              ),
            ],
            if (_selectedRole == 'Employer') ...[
              TextFormField(
                controller: companyAddressController,
                decoration: InputDecoration(labelText: 'Company Address'),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter company address'
                    : null,
              ),
            ],
            SizedBox(height: 25),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: _registerUser,
            ),

          ]),
        ),
      ),
    );
  }
}
