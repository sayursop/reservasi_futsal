import 'package:flutter/material.dart';
import 'package:reservasi_futsal/screen/menu_utama.dart';



class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Menu',
          style: TextStyle(fontSize: 16), // Reduced font size
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Text(
          'Welcome to Main Menu',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class BookingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 117, 116, 116),
        elevation: 0,
        centerTitle: true,  // Center the title
        title: Text(
          'RESERVASI GAYA FUTSAL',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,  // Set the text color to white
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0), // Adjust padding as needed
            child: Image.asset(
              'img/futsal 2.png', // Path to the image
              height: 40,
              width: 40,
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuUtama()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            LocationCard(
              title: 'GAYA FUTSAL LAWEYAN',
              linkText: 'LINK MAP',
              onBookingPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
            ),
            SizedBox(height: 16),
            LocationCard(
              title: 'GAYA FUTSAL JEBRES',
              linkText: 'LINK MAP',
              onBookingPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ),
                child: Text('KEMBALI', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String title;
  final String linkText;
  final VoidCallback onBookingPressed;

  LocationCard({
    required this.title,
    required this.linkText,
    required this.onBookingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            linkText,
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: onBookingPressed,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child: Text('Booking', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Page',
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Text(
          'Booking Page Content Here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
