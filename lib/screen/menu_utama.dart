import 'package:flutter/material.dart';
import 'booking.dart';
import 'login.dart'; // Import the LoginScreen


class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 116, 116),
        title: const Text(
          'RESERVASI GAYA FUTSAL',
          style: TextStyle(
            fontSize: 20, // Adjusted font size if necessary
            color: Colors.white, // Changed text color to white
          ),
        ),
        centerTitle: true, // Centers the title
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Navigate to LoginScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.calendar_today,
              color: Colors.white), // Changed color to white
          onPressed: () {
            // Navigate to BookingMenu
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingMenu()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            FutsalImage(),
            const SizedBox(height: 20),
            ContactInfo(),
          ],
        ),
      ),
    );
  }
}

class FutsalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.grey,
      child: const Center(
        child: Text(
          'gambar lapangan futsal',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey.shade300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.camera_alt, color: Colors.purple),
              SizedBox(width: 8.0),
              Text('@gayafutsalalweyan @gayafutsaljebres'),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone, color: Colors.green),
              SizedBox(width: 10.0),
              Text('089776543245'),
            ],
          ),
        ],
      ),
    );
  }
}
