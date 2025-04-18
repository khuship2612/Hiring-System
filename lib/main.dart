import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship/addjob.dart';
import 'package:internship/homepage.dart';
import 'package:internship/logozoominpage.dart';
import 'package:internship/phoneauth.dart';
import 'package:internship/postedjob.dart';
import 'package:internship/profilelist.dart';
import 'package:internship/setting_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

String? currentUserRole;
String? currentUserName;
String? currentUserEmail;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LogoZoomInPage(),
        '/homepage': (context) => Homepage(),
        '/register': (context) => FormPage(),
        '/login': (context) => LoginPage(),
        '/profilelist': (context) => ProfileListPage(),
        '/postedjob': (context) => postedjob(),
        '/addjob': (context) => RegistrationFormPage(),
        '/settingpage': (context) => SettingsPage(),
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
  final String companyAddress;
  final String? videoUrl;

  Student({
    required this.name,
    required this.email,
    required this.role,
    required this.qualification,
    required this.experience,
    required this.designation,
    required this.locationPreferences,
    required this.companyAddress,
    this.videoUrl,
  });
}

List<Student> studentList = [];

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final qualificationController = TextEditingController();
  final experienceController = TextEditingController();
  final designationController = TextEditingController();
  final locationPreferencesController = TextEditingController();
  final companyAddressController = TextEditingController();

  String _selectedRole = 'Employee';
  File? _videoFile;
  bool _isUploading = false;

  Future<void> _pickVideo() async {
    final picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _videoFile = File(picked.path);
      });
    }
  }

  Future<void> _recordVideo() async {
    final picked = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _videoFile = File(picked.path);
      });
    }
  }

  Future<String?> _uploadVideo(File video) async {
    try {
      setState(() {
        _isUploading = true;
      });

      String fileName = path.basename(video.path);
      Reference ref = FirebaseStorage.instance.ref().child('videos/$fileName');
      await ref.putFile(video);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Upload error: $e');
      return null;
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      String? videoUrl;
      if (_selectedRole == 'Employee' && _videoFile != null) {
        videoUrl = await _uploadVideo(_videoFile!);
      }

      Student newStudent = Student(
        name: nameController.text,
        email: emailController.text,
        qualification: qualificationController.text,
        experience: experienceController.text,
        designation: designationController.text,
        locationPreferences: locationPreferencesController.text,
        companyAddress: companyAddressController.text,
        role: _selectedRole,
        videoUrl: videoUrl,
      );

      studentList.add(newStudent);
      currentUserRole = _selectedRole;
      currentUserName = nameController.text;
      currentUserEmail = emailController.text;

      Navigator.pushNamed(context, '/profilelist');
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your name' : null,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your email' : null,
            ),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Number'),
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your number' : null,
            ),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: InputDecoration(labelText: 'Role'),
              items: ['Employee', 'Employer'].map((role) {
                return DropdownMenuItem(value: role, child: Text(role));
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
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your qualification' : null,
              ),
              TextFormField(
                controller: experienceController,
                decoration: InputDecoration(labelText: 'Experience'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your experience' : null,
              ),
              TextFormField(
                controller: designationController,
                decoration: InputDecoration(labelText: 'Designation'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your designation' : null,
              ),
              TextFormField(
                controller: locationPreferencesController,
                decoration: InputDecoration(labelText: 'Location Preferences'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter location preferences' : null,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _pickVideo,
                    icon: Icon(Icons.video_library),
                    label: Text('Upload Video'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _recordVideo,
                    icon: Icon(Icons.videocam),
                    label: Text('Record Video'),
                  ),
                ],
              ),
              if (_videoFile != null)
                Text("Video selected: ${path.basename(_videoFile!.path)}"),
            ],
            if (_selectedRole == 'Employer') ...[
              TextFormField(
                controller: companyAddressController,
                decoration: InputDecoration(labelText: 'Company Address'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter company address' : null,
              ),
            ],
            SizedBox(height: 25),
            _isUploading
                ? CircularProgressIndicator()
                : ElevatedButton(
              child: Text('Submit'),
              onPressed: _registerUser,
            ),
          ]),
        ),
      ),
    );
  }
}
