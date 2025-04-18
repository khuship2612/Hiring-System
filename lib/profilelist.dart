import 'package:flutter/material.dart';
import 'package:internship/main.dart';
import 'package:video_player/video_player.dart';

class ProfileListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? userRole = currentUserRole;
    final List<Student> filteredList =
    studentList.where((student) => student.role != userRole).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Profiles')),
      endDrawer: userRole == 'Employee' ? EmployeeDrawer() : EmployerDrawer(),
      body: filteredList.isNotEmpty
          ? ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final student = filteredList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.blueGrey.shade200, width: 1.5),
            ),
            elevation: 5,
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  student.name[0],
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              title: Text(
                student.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Text(
                student.role == 'Employee'
                    ? 'Experience: ${student.experience}\n${student.designation} | ${student.locationPreferences}'
                    : 'Company Address: ${student.companyAddress}',
                style: TextStyle(height: 1.5),
              ),
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
          : Center(child: Text('No profiles available')),
    );
  }
}

class EmployeeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(currentUserName ?? 'Unknown'),
            accountEmail: Text(currentUserEmail ?? 'No email'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                currentUserName != null && currentUserName!.isNotEmpty ? currentUserName![0] : 'U',
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settingpage');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout', style: TextStyle(fontSize: 18)),
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirm Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(child: Text("No"), onPressed: () => Navigator.of(context).pop()),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

class EmployerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(currentUserName ?? 'Unknown'),
            accountEmail: Text(currentUserEmail ?? 'No email'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                currentUserName != null && currentUserName!.isNotEmpty ? currentUserName![0] : 'U',
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Posted Jobs'),
            onTap: () => Navigator.pushNamed(context, '/postedjob'),
          ),
          ListTile(
            leading: Icon(Icons.post_add),
            title: Text('Add Job'),
            onTap: () => Navigator.pushNamed(context, '/addjob'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settingpage');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirm Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(child: Text("No"), onPressed: () => Navigator.of(context).pop()),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  final Student student;
  StudentProfilePage({required this.student});

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.student.videoUrl != null && widget.student.videoUrl!.isNotEmpty) {
      _controller = VideoPlayerController.network(widget.student.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
          _controller?.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final student = widget.student;

    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: currentUserRole == 'Employee' ? EmployeeDrawer() : EmployerDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffc7e6fa), Color(0xff63b8f4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueGrey,
                child: Text(student.name[0], style: TextStyle(fontSize: 50, color: Colors.white)),
              ),
            ),
            SizedBox(height: 30),

            // 👇 Video Section
            if (_controller != null && _controller!.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
            if (_controller != null && _controller!.value.isInitialized)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(_controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        _controller!.value.isPlaying
                            ? _controller!.pause()
                            : _controller!.play();
                      });
                    },
                  ),
                ],
              ),

            SizedBox(height: 20),
            _infoText("Name", student.name),
            _infoText("Experience", student.experience),
            _infoText("Designation", student.designation),
            _infoText("Location Preferences", student.locationPreferences),
          ],
        ),
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        '$label: $value',
        style: TextStyle(fontSize: 20, color: Colors.white),
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
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: currentUserRole == 'Employee' ? EmployeeDrawer() : EmployerDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffafd6f1), Color(0xff33a6f8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueGrey,
                child: Text(student.name[0], style: TextStyle(fontSize: 50, color: Colors.white)),
              ),
            ),
            SizedBox(height: 40),
            _infoText("Company Name", student.name),
            _infoText("Company Address", student.companyAddress),
            _infoText("Official Email", student.email),
          ],
        ),
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        '$label: $value',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
