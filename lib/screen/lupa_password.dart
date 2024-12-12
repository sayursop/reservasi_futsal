import 'package:flutter/material.dart';

class LupaPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LUPA PASSWORD',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        centerTitle: true, // Center the title
        backgroundColor: const Color.fromARGB(255, 117, 116, 116),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'img/futsal 2.png',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              // Title
              const Text(
                'RESET PASSWORD',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40),

              // Username Field
              buildTextField(
                hintText: 'Masukkan Username Anda',
                labelText: 'Username',
                icon: Icons.person,
              ),
              
              const SizedBox(height: 20),

              // New Password Field
              buildTextField(
                hintText: 'Masukkan Password Baru Anda',
                labelText: 'Password Baru',
                icon: Icons.lock,
                obscureText: true,
              ),
              
              const SizedBox(height: 20),

              // Confirm Password Field
              buildTextField(
                hintText: 'Konfirmasi Password Baru Anda',
                labelText: 'Konfirmasi Password Baru',
                icon: Icons.lock,
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // Phone Number Field
              buildTextField(
                hintText: 'Masukkan No HP Anda',
                labelText: 'No HP',
                icon: Icons.phone,
              ),
              
              const SizedBox(height: 30),

              // Reset Button
              ElevatedButton(
                onPressed: () {
                  // Logic for resetting password
                  Navigator.pop(context); // Return to Login page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 117, 116, 116),
                  foregroundColor: Colors.white, // Set text color to white
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reuse the buildTextField method for consistent styling
  Widget buildTextField({
    required String hintText,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
