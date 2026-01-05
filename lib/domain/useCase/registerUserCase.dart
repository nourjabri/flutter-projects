class RegisterUseCase {
  Future<void> call({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
