import 'package:flutter/material.dart';
import 'package:lokee/pages/loginScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const SUPABASE_URL = 'https://irhxjtvtfzryzvbeezdv.supabase.co';
const SUPABASE_ANNON_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlyaHhqdHZ0ZnpyeXp2YmVlemR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU1MzQzMzcsImV4cCI6MjA4MTExMDMzN30.pSh0416-TRE2y22Xp5r3k1rS1kX-6o6H2Ch-yM3w74o';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://irhxjtvtfzryzvbeezdv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlyaHhqdHZ0ZnpyeXp2YmVlemR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU1MzQzMzcsImV4cCI6MjA4MTExMDMzN30.pSh0416-TRE2y22Xp5r3k1rS1kX-6o6H2Ch-yM3w74o'
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const MainNavigation(),
      home: LoginScreen(),
    );
  }
}
