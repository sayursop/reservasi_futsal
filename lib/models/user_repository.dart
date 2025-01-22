// lib/models/user_repository.dart
import 'user.dart';

class UserRepository {
  static List<User> _users = [];
  
  static void register(String username, String password) {
    _users.add(User(username: username, password: password));
  }
  
  static bool login(String username, String password) {
    return _users.any((user) => 
      user.username == username && user.password == password);
  }
  
  static bool changePassword(String username, String oldPassword, String newPassword) {
    int index = _users.indexWhere((user) => 
      user.username == username && user.password == oldPassword);
    
    if (index != -1) {
      _users[index].password = newPassword;
      return true;
    }
    return false;
  }
}