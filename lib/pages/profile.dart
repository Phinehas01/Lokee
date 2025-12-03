import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Italic',
          ),
        ),
      ),
      
    );
  }
}
