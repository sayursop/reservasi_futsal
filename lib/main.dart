import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Pastikan path-nya benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservasi Gaya Futsal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Route pertama
      routes: {
        '/': (context) => LoginScreen(),
        // Rute lainnya
      },
    );
  }
}
