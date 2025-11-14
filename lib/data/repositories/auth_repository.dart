class AuthRepository {
  Future<bool> registerUser(
      {required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String email}) async {
    await Future.delayed(const Duration(seconds: 1));
    print("User Register $email");
    return true;
  }
}
