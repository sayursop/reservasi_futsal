import 'package:flutter/material.dart';
import '../models/booking_model.dart'; // Import model Booking
import 'booking_screen.dart'; // Import BookingScreen

class PaymentReceiptScreen extends StatelessWidget {
  final List<Booking> bookings;
  final double totalPrice;

  const PaymentReceiptScreen({Key? key, required this.bookings, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3E8EFC), // Biru cerah
              Color(0xFF56CCF2), // Biru lebih terang
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.payment,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bukti Pembayaran',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Terima Kasih!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pembayaran Anda telah berhasil.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Total Pembayaran: Rp. $totalPrice',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Detail Pembayaran:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  // Menampilkan detail pemesanan
                  ListView.builder(
                    itemCount: bookings.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final booking = bookings[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text('${booking.name} (${booking.phone})'),
                          subtitle: Text('Jadwal: ${booking.jadwal}'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Status pembayaran lunas
                  const Text(
                    'Status Pembayaran: Lunas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(height: 30),
                  // Tombol "Selesai"
                  ElevatedButton(
                    onPressed: () {
                      // Kembali ke halaman pemesanan
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(location: 'Lokasi Anda'),
                        ),
                      );
                    },
                    child: const Text('Selesai'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 238, 241, 245),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
