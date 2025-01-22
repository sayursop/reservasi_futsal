class Booking {
  final String name;
  final String phone;
  final String jadwal;
  final String? id;
  bool statusLunas; // Menambahkan status lunas

  Booking({
    required this.name,
    required this.phone,
    required this.jadwal,
    this.id,
    this.statusLunas = false, // Default statusLunas adalah false (belum lunas)
  });

  // Fungsi untuk mengonversi Booking menjadi Map untuk database
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'jadwal': jadwal,
      'statusLunas': statusLunas ? 1 : 0, // Menyimpan status lunas sebagai 1 atau 0
    };
  }

  // Fungsi untuk membuat instance Booking dari Map
  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      name: map['name'],
      phone: map['phone'],
      jadwal: map['jadwal'],
      id: map['id'],
      statusLunas: map['statusLunas'] == 1, // Mengonversi 1 atau 0 ke boolean
    );
  }
}
