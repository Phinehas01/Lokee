import 'package:flutter/material.dart';
import 'package:lokee/pages/home.dart';
import 'package:lokee/pages/signupScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final supabase = Supabase.instance.client;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;

  Future<void> loginUser() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      showError("Username and password are required");
      return;
    }

    setState(() => _loading = true);

    try {
      // 🔍 1. Find user email using username
      final record = await supabase
          .from('profiles')
          .select('email')
          .eq('username', username)
          .maybeSingle();

      if (record == null) {
        showError("Username not found");
        setState(() => _loading = false);
        return;
      }

      final email = record['email'];

      // 🔐 2. Login with email + password
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        showError("Invalid login credentials");
      } else {
        // 🎉 3. Navigate to HomeScreen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      showError(e.toString());
    }

    setState(() => _loading = false);
  }

  void showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F2F9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // Username
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 18),

              // Password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 40),

              // LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _loading ? null : loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6C4EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                ),
                child: const Text(
                  "Create an account",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
