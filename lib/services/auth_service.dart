// lib/services/auth_service.dart
import '../models/user.dart';
import '../models/user_repository.dart';

class AuthResult {
  final bool success;
  final String message;
  final User? user;

  AuthResult({
    required this.success,
    required this.message,
    this.user,
  });
}

class AuthService {
  static final AuthService _instance = AuthService._internal();
  
  factory AuthService() {
    return _instance;
  }
  
  AuthService._internal();
  
  Future<AuthResult> login(String username, String password) async {
    // Simulasi network delay
    await Future.delayed(Duration(seconds: 1));
    
    try {
      // Validasi input
      if (username.isEmpty || password.isEmpty) {
        return AuthResult(
          success: false,
          message: 'Username dan password harus diisi',
        );
      }

      // Cek login di repository
      bool isValid = UserRepository.login(username, password);
      
      if (isValid) {
        return AuthResult(
          success: true,
          message: 'Login berhasil',
          user: User(username: username, password: password),
        );
      } else {
        return AuthResult(
          success: false,
          message: 'Username atau password salah',
        );
      }
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  Future<AuthResult> register(String username, String password, String confirmPassword) async {
    // Simulasi network delay
    await Future.delayed(Duration(seconds: 1));
    
    try {
      // Validasi input
      if (username.isEmpty || password.isEmpty) {
        return AuthResult(
          success: false,
          message: 'Semua field harus diisi',
        );
      }

      if (password != confirmPassword) {
        return AuthResult(
          success: false,
          message: 'Password tidak cocok',
        );
      }

      // Minimal password length
      if (password.length < 6) {
        return AuthResult(
          success: false,
          message: 'Password minimal 6 karakter',
        );
      }

      // Register user baru
      UserRepository.register(username, password);
      
      return AuthResult(
        success: true,
        message: 'Registrasi berhasil',
        user: User(username: username, password: password),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  Future<AuthResult> changePassword(
    String username,
    String oldPassword,
    String newPassword,
    String confirmNewPassword
  ) async {
    // Simulasi network delay
    await Future.delayed(Duration(seconds: 1));
    
    try {
      // Validasi input
      if (oldPassword.isEmpty || newPassword.isEmpty || confirmNewPassword.isEmpty) {
        return AuthResult(
          success: false,
          message: 'Semua field harus diisi',
        );
      }

      if (newPassword != confirmNewPassword) {
        return AuthResult(
          success: false,
          message: 'Password baru tidak cocok',
        );
      }

      // Minimal password length
      if (newPassword.length < 6) {
        return AuthResult(
          success: false,
          message: 'Password minimal 6 karakter',
        );
      }

      // Update password
      bool isSuccess = UserRepository.changePassword(username, oldPassword, newPassword);
      
      if (isSuccess) {
        return AuthResult(
          success: true,
          message: 'Password berhasil diubah',
        );
      } else {
        return AuthResult(
          success: false,
          message: 'Password lama salah',
        );
      }
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }
}