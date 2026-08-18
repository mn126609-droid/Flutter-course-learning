// Profile file
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screans/home.dart';
// import 'home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
