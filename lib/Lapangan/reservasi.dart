class ReservasiLapangan {
  String lapangan;
  String hari;
  String jam;

  // Constructor
  ReservasiLapangan({required this.lapangan, required this.hari, required this.jam});

  // Method untuk menampilkan informasi reservasi
  void displayInfo() {
    print('Reservasi Lapangan:');
    print('Lapangan: $lapangan');
    print('Hari: $hari');
    print('Jam: $jam');
  }

  // Method untuk mengganti jadwal reservasi
  void ubahJadwal(String hariBaru, String jamBaru) {
    hari = hariBaru;
    jam = jamBaru;
    print('Jadwal berhasil diubah!');
  }
}