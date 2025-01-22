import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_screen.dart'; // Import LoginScreen
import 'schedule_screen.dart'; // Import ScheduleScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3E8EFC), // Bright blue
              Color(0xFF56CCF2), // Lighter blue
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text('Reservasi Gaya Futsal'),
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.book_online),
                    onPressed: () {
                      String location = 'Lapangan 1';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleScreen(
                            location: location,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Menampilkan gambar
                    Image.asset(
                      'assets/img/foto_2.jpeg',
                      width: 500, // Menentukan lebar gambar
                      height: 200, // Menentukan tinggi gambar
                      fit: BoxFit
                          .cover, // Menentukan bagaimana gambar harus dipotong atau diperbesar
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.sports_soccer,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Selamat Datang Reservasi Gaya Futsal!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          child: FaIcon(FontAwesomeIcons.whatsapp),
                          backgroundColor: Colors.green.shade800,
                          onPressed: () {
                            String url =
                                "https://wa.me/+087456646467/?text=Hello";
                            launch(url);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
