import 'package:flutter/material.dart';

class BuatAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 116, 116),
        elevation: 0,
        title: Center(
          child: Text(
            'BUAT AKUN',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white, // Change the title color to white
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'img/futsal 2.png', // Image moved to AppBar
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title centered
                Center(
                  child: const Text(
                    'BUAT AKUN',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),

                // Username Input
                buildTextField(
                  hintText: 'Masukkan Username Anda',
                  labelText: 'Username',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),

                // Password Input
                buildTextField(
                  hintText: 'Masukkan Password Baru Anda',
                  labelText: 'Password Baru',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // Phone Number Input
                buildTextField(
                  hintText: 'Masukkan No HP Anda',
                  labelText: 'No HP',
                  icon: Icons.phone,
                ),
                const SizedBox(height: 30),

                // Create Account Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic for account creation
                      Navigator.pop(context); // Go back to the login page
                    },
                    style: ElevatedButton.styleFrom(
                       backgroundColor: const Color.fromARGB(255, 117, 116, 116),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Buat Akun',
                      style: TextStyle(color: Colors.white), // White text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to create TextField
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
