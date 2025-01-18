class RegisterLogic {
  String? validateInput(String name, String password, String confirmPassword) {
    if (name.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return 'Vul alle velden in.';
    }
    if (password != confirmPassword) {
      return 'Wachtwoorden komen niet overeen.';
    }
    return null; // Geen foutmeldingen
  }
}
