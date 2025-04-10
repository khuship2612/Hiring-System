import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Registered Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, '/profilelist');
              },
            ),
          ],
        ),
      ),
    );
  }
}