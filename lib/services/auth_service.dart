import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // --- Username Check ---
  Future<bool> isUsernameTaken(String username) async {
    final result = await _db.collection('users')
      .where('username', isEqualTo: username)
      .get();
    return result.docs.isNotEmpty;
  }

  // --- Signup ---
  Future<String?> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    File? profilePic,
  }) async {
    try {
      // 1. Create auth user
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Upload profile pic
      String? imageUrl;
      if (profilePic != null) {
        final ref = FirebaseStorage.instance
            .ref("profilePics/${userCred.user!.uid}.jpg");
        await ref.putFile(profilePic);
        imageUrl = await ref.getDownloadURL();
      }

      // 3. Save user in Firestore
      await _db.collection('users').doc(userCred.user!.uid).set({
        "uid": userCred.user!.uid,
        "name": name,
        "username": username,
        "email": email,
        "profile_pic": imageUrl,
        "created_at": DateTime.now(),
      });

      // 4. Send email verification
      await userCred.user!.sendEmailVerification();

      return null; // success

    } catch (e) {
      return e.toString();
    }
  }

  // --- Login ---
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
