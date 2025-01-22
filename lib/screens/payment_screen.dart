import 'package:flutter/material.dart';
import '../models/booking_model.dart'; // Import model Booking
import 'payment_receipt_screen.dart'; // Import PaymentReceiptScreen

class PaymentScreen extends StatelessWidget {
  final List<Booking> bookings;
  final Map<String, int> hargaJadwal;

  const PaymentScreen({Key? key, required this.bookings, required this.hargaJadwal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var booking in bookings) {
      totalPrice += hargaJadwal[booking.jadwal] ?? 0;
    }

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
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
                  'Pembayaran Futsal',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Detail Pemesanan:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                // Menampilkan daftar pemesanan
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
                        subtitle: Text('Jadwal: ${booking.jadwal} - Rp.${hargaJadwal[booking.jadwal]}'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Total Pembayaran: Rp. $totalPrice',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Tombol Konfirmasi Pembayaran
                ElevatedButton(
                  onPressed: () {
                    // Konfirmasi pembayaran
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi Pembayaran'),
                          content: const Text('Pembayaran berhasil dilakukan!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Menutup dialog
                                // Arahkan ke halaman bukti pembayaran
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentReceiptScreen(
                                      bookings: bookings,
                                      totalPrice: totalPrice,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Konfirmasi Pembayaran',
                    style: TextStyle(
                      color: Color(0xFF3E8EFC),
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
    );
  }
}
