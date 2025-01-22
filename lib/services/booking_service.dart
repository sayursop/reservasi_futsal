import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/booking_model.dart'; // Import model Booking

// Booking constants
const List<String> jadwalList = [
  '10:00 - 12:00',
  '12:00 - 14:00',
  '14:00 - 16:00',
  '16:00 - 18:00',
];

const Map<String, int> hargaJadwal = {
  '10:00 - 12:00': 50000,
  '12:00 - 14:00': 50000,
  '14:00 - 16:00': 100000,
  '16:00 - 18:00': 100000,
};

class BookingService {
  static const String _bookingKey = 'bookings';

  // Menyimpan daftar pemesanan ke SharedPreferences
  static Future<void> saveBookings(List<Booking> bookings) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookingJsonList = bookings
        .map((booking) => jsonEncode(booking.toMap()))
        .toList(); // Mengonversi Booking ke JSON
    await prefs.setStringList(_bookingKey, bookingJsonList);
  }

  // Mengambil daftar pemesanan dari SharedPreferences
  static Future<List<Booking>> getBookings() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookingJsonList = prefs.getStringList(_bookingKey) ?? [];
    List<Booking> bookings = bookingJsonList
        .map((json) => Booking.fromMap(jsonDecode(json)))
        .toList(); // Mengonversi JSON ke Booking
    return bookings;
  }

  // Menghapus semua pemesanan dari SharedPreferences
  static Future<void> clearBookings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_bookingKey);
  }
}
