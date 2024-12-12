import 'package:flutter/material.dart';
import 'menu_utama.dart';
import 'lupa_password.dart';
import 'buat_akun.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RESERVASI GAYA FUTSAL',
          style: TextStyle(color: Colors.white), // Set the title color to white
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 116, 116),
        automaticallyImplyLeading: false, // Remove the back arrow
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'img/futsal 2.png', // Image for the AppBar
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username Field
            _buildTextField(
              hintText: 'Masukkan Username Anda',
              labelText: 'Username',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),

            // Password Field
            _buildTextField(
              hintText: 'Masukkan Password Anda',
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 30),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuUtama(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 133, 123, 123),
                foregroundColor: Colors.white, // Set the text color to white
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),

            // Lupa Password Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LupaPasswordPage(),
                  ),
                );
              },
              child: const Text(
                'Lupa Password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),

            // Buat Akun Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuatAkun(),
                  ),
                );
              },
              child: const Text(
                'Buat Akun?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simplified TextField Builder
  Widget _buildTextField({
    required String hintText,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
 