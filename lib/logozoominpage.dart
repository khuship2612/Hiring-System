import 'package:flutter/material.dart';

class LogoZoomInPage extends StatefulWidget {
  @override
  _LogoZoomInPageState createState() => _LogoZoomInPageState();
}

class _LogoZoomInPageState extends State<LogoZoomInPage> {
  double _scale = 0.2; // Initial small scale value

  @override
  void initState() {
    super.initState();
    // Start the zoom-in animation and navigate to register page after animation completes
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _scale = 1.0; // Zoom in to normal size
      });

      // After the zoom-in animation completes, navigate to register page
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/homepage');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedScale(
          scale: _scale, // Current scale value
          duration: Duration(seconds: 2), // Duration of the zoom-in animation
          curve: Curves.easeIn, // Smooth zoom-in effect
          child: Image.asset(
            'assets/images/TECHHIRE1.png', // Path to your logo image
            width: 1000, // Initial width before zooming in
            height: 1000, // Initial height before zooming in
          ),
        ),
      ),
    );
  }
}