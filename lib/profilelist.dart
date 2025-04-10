import 'package:flutter/material.dart';
import 'package:internship/main.dart';

class ProfileListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? userRole = currentUserRole;
    final List<Student> filteredList =
    studentList.where((student) => student.role != userRole).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),endDrawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          ListTile(
            title: Text('Settings',
            style: TextStyle(fontSize: 20),),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('Logout',
                style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),
        ],
      ),
    ),
      body: filteredList.isNotEmpty
          ? ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final student = filteredList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.blueGrey, width: 1.5),
            ),
            elevation: 4,
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(
                  student.name[0],
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              title: Text(
                student.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              subtitle: Text(student.role == 'Employee'
                  ? '${student.experience} (${student.designation}) (${student.locationPreferences})'
                  : 'Company Address: ${student.companyAddress}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => student.role == 'Employee'
                        ? StudentProfilePage(student: student)
                        : CompanyProfilePage(student: student),
                  ),
                );
              },
            ),
          );
        },
      )
          : Center(
        child: Text('No profiles available'),
      ),
    );
  }
}

class StudentProfilePage extends StatelessWidget {
  final Student student;
  StudentProfilePage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Posted Jobs'),
              onTap: () {
                Navigator.pushNamed(context, '/postedjob');
              },
            ),
            ListTile(
              leading: Icon(Icons.post_add),
              title: Text('Add Job'),
              onTap: () {
                Navigator.pushNamed(context, '/addjob');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                Navigator.pushNamed(context, '/logout');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffc7e6fa),
              Color(0xff8bbee1),
              Color(0xff63b8f4),
              Color(0xff3395f8)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.blueGrey,
                  child: Text(
                    student.name[0],
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ),
              SizedBox(height: 160),
              Text('Name: ${student.name}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
              Text('Experience: ${student.experience}',
                  style: TextStyle(fontSize: 20, color: Colors.white70)),
              Text('Designation: ${student.designation}',
                  style: TextStyle(fontSize: 20, color: Colors.white70)),
              Text('Location Preferences: ${student.locationPreferences}',
                  style: TextStyle(fontSize: 20, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyProfilePage extends StatelessWidget {
  final Student student;
  CompanyProfilePage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffafd6f1),
              Color(0xff6ec2fd),
              Color(0xff33a6f8)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueGrey,
                  child: Text(
                    student.name[0],
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Text('Company Name: ${student.name}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
              Text('Company Address: ${student.companyAddress}',
                  style: TextStyle(fontSize: 20, color: Colors.white70)),
              Text('Official Email: ${student.email}',
                  style: TextStyle(fontSize: 20, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}




