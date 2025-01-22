class User {
  String username;
  String password;

  User({required this.username, required this.password});

  // Hardcoded user for login validation (temporary)
  static final User sampleUser =
      User(username: 'futsal123', password: 'futsal123');

  // Method to validate login
  bool validateLogin(String username, String password) {
    return username == sampleUser.username && password == sampleUser.password;
  }
}
