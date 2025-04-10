import 'package:flutter/material.dart';

void showLogoutConfirmationDialog(BuildContext context, VoidCallback onLogout) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(); // close the dialog
            },
          ),
          ElevatedButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(); // close the dialog
              onLogout(); // perform actual logout
            },
          ),
        ],
      );
    },
  );
}
