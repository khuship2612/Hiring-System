import 'package:flutter/material.dart';

class postedjob extends StatefulWidget {
  const postedjob({super.key});

  @override
  State<postedjob> createState() => _postedjobState();
}

class _postedjobState extends State<postedjob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Technical()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff267bfb),
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(
                    horizontal: 140, vertical: 20),
              ),
              child: Text(
                "Technical",
                style: TextStyle(fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: 10),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CertifiedProfession()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff56f344),
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(
                    horizontal: 82, vertical: 20),
              ),
              child: Text(
                "Certified Profession",
                style: TextStyle(fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: 10),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Management()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff36444),
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(
                    horizontal: 120, vertical: 20),
              ),
              child: Text(
                "Management",
                style: TextStyle(fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: 10),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Strategic()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffa950f3),
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(
                    horizontal: 145, vertical: 20),
              ),
              child: Text(
                "Strategic",
                style: TextStyle(fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: 10),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => General()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff63e53),
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(
                    horizontal: 150, vertical: 20),
              ),
              child: Text(
                "General",
                style: TextStyle(fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Technical extends StatefulWidget {
  const Technical({super.key});

  @override
  State<Technical> createState() => _TechnicalState();
}

class _TechnicalState extends State<Technical> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Management extends StatefulWidget {
  const Management({super.key});

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class CertifiedProfession extends StatefulWidget {
  const CertifiedProfession({super.key});

  @override
  State<CertifiedProfession> createState() => _CertifiedProfessionState();
}

class _CertifiedProfessionState extends State<CertifiedProfession> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Strategic extends StatefulWidget {
  const Strategic({super.key});

  @override
  State<Strategic> createState() => _StrategicState();
}

class _StrategicState extends State<Strategic> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}