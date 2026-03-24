import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> registerUser(
      {required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String email}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final uid = credential.user!.uid;
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "createdAt": DateTime.now(),
      });
      return true;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Ukown Firebase error";
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Ukown Firebase error";
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  User? get currentUser => auth.currentUser;

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final doc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      return doc.data();
    } catch (e) {
      debugPrint("Get user data error");
      return null;
    }
  }
}
