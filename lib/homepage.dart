import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffeaf3fa),
                    Color(0xffd5e9f8),
                    Color(0xff2e86c5)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Opacity(
              opacity: 0.3, // Set the opacity to make it look like a watermark
              child: Center(
                child: Image.asset(
                  'assets/images/bg.png', // Add your watermark image in assets
                  height:1300, // Adjust the size as necessary
                  width: 900,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Expanded(
                      flex: 6,
                      child: Image.asset(
                        'assets/images/TECHHIRE1.png',
                        alignment: Alignment.topCenter,
                        height: 4000,
                        width: 3000,
                      )),
                  const Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Text(
                          "Get shortlisted in just 60 Sec",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register'); // Navigate to create resume
                          },
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff71829f)),
                          ),
                        ),
                        Text("Are you a member?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xb3ffffff))),
                        SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/profilelist');
                          },
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}