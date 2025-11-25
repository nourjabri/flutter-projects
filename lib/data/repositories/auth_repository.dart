import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> registerUser(
      {required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String email}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.currentUser!.updateDisplayName("$firstName $lastName");
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
}
