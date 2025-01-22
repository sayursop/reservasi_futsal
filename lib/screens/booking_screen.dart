import 'package:flutter/material.dart';
import '../models/booking_model.dart'; // Import model Booking
import 'payment_screen.dart'; // Import PaymentScreen
import '../services/booking_service.dart'; // Import BookingService


class BookingScreen extends StatefulWidget {
  final String location;

  const BookingScreen({Key? key, required this.location}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedJadwal;

  List<Booking> bookings = [];
  List<int> selectedBookingsIndexes = []; // Daftar indeks pemesanan yang dipilih

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  Future<void> _loadBookings() async {
    final loadedBookings = await BookingService.getBookings();
    setState(() {
      bookings = loadedBookings;
    });
  }

  void addBooking() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedJadwal != null) {
      setState(() {
        final newBooking = Booking(
          name: nameController.text,
          phone: phoneController.text,
          jadwal: selectedJadwal!,
        );
        bookings.add(newBooking);
        BookingService.saveBookings(bookings);
        nameController.clear();
        phoneController.clear();
        selectedJadwal = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua data harus diisi!')),
      );
    }
  }

  void deleteBooking(int index) {
    setState(() {
      bookings.removeAt(index);
      BookingService.saveBookings(bookings);
    });
  }

  void editBooking(int index) {
    setState(() {
      final booking = bookings[index];
      nameController.text = booking.name;
      phoneController.text = booking.phone;
      selectedJadwal = booking.jadwal;
      bookings.removeAt(index);
      BookingService.saveBookings(bookings);
    });
  }

  void toggleBookingSelection(int index, bool? value) {
    setState(() {
      if (value == true) {
        selectedBookingsIndexes.add(index);
      } else {
        selectedBookingsIndexes.remove(index);
      }
    });
  }

  void toggleLunasStatus(int index) {
    setState(() {
      final booking = bookings[index];
      booking.statusLunas = !booking.statusLunas;
      BookingService.saveBookings(bookings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan - ${widget.location}'),
        backgroundColor: const Color(0xFF3E8EFC),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3E8EFC), // Bright blue
              Color(0xFF56CCF2), // Light blue
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedJadwal,
                items: jadwalList.map((jadwal) {
                  return DropdownMenuItem<String>(
                    value: jadwal,
                    child: Text('$jadwal - Rp.${hargaJadwal[jadwal]}'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedJadwal = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Pilih Jadwal',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Pesan',
                  style: TextStyle(color: Color(0xFF3E8EFC)),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Daftar Pemesanan',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: bookings.isEmpty
                    ? const Center(
                        child: Text(
                          'Belum ada pemesanan.',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : ListView.builder(
                        itemCount: bookings.length,
                        itemBuilder: (context, index) {
                          final booking = bookings[index];
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text('${booking.name} (${booking.phone})'),
                              subtitle: Text('Jadwal: ${booking.jadwal}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () => editBooking(index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => deleteBooking(index),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      booking.statusLunas
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: booking.statusLunas
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    onPressed: () => toggleLunasStatus(index),
                                  ),
                                ],
                              ),
                              leading: Checkbox(
                                value: selectedBookingsIndexes.contains(index),
                                onChanged: (value) {
                                  toggleBookingSelection(index, value);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedBookingsIndexes.isEmpty
                    ? null
                    : () {
                        List<Booking> selectedBookings = selectedBookingsIndexes
                            .map((index) => bookings[index])
                            .toList();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                              bookings: selectedBookings,
                              hargaJadwal: hargaJadwal,
                            ),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Lanjut ke Pembayaran',
                  style: TextStyle(color: Color.fromARGB(255, 230, 232, 235)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
