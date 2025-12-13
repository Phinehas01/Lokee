// lib/screens/signup_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lokee/pages/loginScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final supabase = Supabase.instance.client;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmCtrl = TextEditingController();

  File? _pickedImage;
  bool _loading = false;

  final ImagePicker _picker = ImagePicker();

  // ------------------------- PICK IMAGE -------------------------
  Future<void> _pickImage(ImageSource source) async {
    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 75,
    );
    if (file == null) return;
    setState(() => _pickedImage = File(file.path));
  }

  // -------------------- CHECK USERNAME --------------------------
  Future<bool> _isUsernameTaken(String username) async {
    try {
      final data = await supabase
          .from('profiles')
          .select('id')
          .eq('username', username)
          .maybeSingle();

      return data != null; // if null = free
    } catch (_) {
      return true; // treat error as "taken"
    }
  }

  // -------------------- UPLOAD AVATAR IMAGE ---------------------
  Future<String?> _uploadAvatar(String userId, File file) async {
    try {
      final bytes = await file.readAsBytes();
      final ext = file.path.split('.').last;
      final filePath = 'avatars/$userId/avatar.$ext';

      await supabase.storage
          .from('avatars')
          .uploadBinary(
            filePath,
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );

      final publicUrl = supabase.storage.from('avatars').getPublicUrl(filePath);

      return publicUrl;
    } catch (e) {
      print('Upload error: $e');
      return null;
    }
  }

  // ------------------------ HANDLE SIGNUP ------------------------
  Future<void> _handleSignup() async {
    final name = nameCtrl.text.trim();
    final username = usernameCtrl.text.trim().toLowerCase();
    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text;

    if (name.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage("Please fill all fields.");
      return;
    }

    if (password != confirmCtrl.text) {
      _showMessage("Passwords do not match.");
      return;
    }

    setState(() => _loading = true);

    // Check username
    final taken = await _isUsernameTaken(username);
    if (taken) {
      _showMessage("Username already taken.");
      setState(() => _loading = false);
      return;
    }

    try {
      // ------------ SIGN UP USER --------------
      final AuthResponse authRes = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': name},
      );

      final user = authRes.user;

      if (user == null) {
        _showMessage("Please verify your email to continue.");
        setState(() => _loading = false);
        return;
      }

      final userId = user.id;

      // -------- UPLOAD AVATAR IF EXISTS --------
      String? avatarUrl;
      if (_pickedImage != null) {
        avatarUrl = await _uploadAvatar(userId, _pickedImage!);
      }

      // -------- INSERT ROW IN PROFILES --------
      await supabase.from('profiles').insert({
        'id': userId,
        'full_name': name,
        'username': username,
        'email': email,
        'avatar_url': avatarUrl,
      });

      // If session exists = auto login
      if (authRes.session != null) {
        _showMessage("Welcome! You're logged in.");
        Navigator.pushReplacementNamed(context, '/');
      } else {
        _showMessage("Account created. Please verify your email.");
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      _showMessage("Signup error: $e");
    } finally {
      setState(() => _loading = false);
    }
  }

  void _showMessage(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    usernameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmCtrl.dispose();
    super.dispose();
  }

  // -------------------------- UI ------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign up and start using Lokee",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 25),

              GestureDetector(
                onTap: _showImageOptions,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: _pickedImage != null
                      ? FileImage(_pickedImage!)
                      : null,
                  child: _pickedImage == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 32,
                          color: Colors.grey,
                        )
                      : null,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Full name"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: usernameCtrl,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: confirmCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _loading ? null : _handleSignup,
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Sign Up"),
                ),
              ),

              const SizedBox(height: 14),

              TextButton(
                onPressed: () =>
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      )
                    ),
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Pick from gallery"),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take photo"),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
