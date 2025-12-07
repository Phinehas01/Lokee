import 'package:flutter/material.dart';
import 'package:lokee/pages/loginScreen.dart';
import 'package:lokee/pages/main_navigation.dart';
import 'package:lokee/pages/signupScree.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const MainNavigation(),
     home: SignupScreen(),    
    );
  }
}
