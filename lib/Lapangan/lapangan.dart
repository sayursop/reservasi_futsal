class Lapangan {
  final String namaLapangan;
  final String lokasi;
  final String jenisLapangan;
  final String fasilitas;
  final double hargaPerJam;
  final String gambar;
  final String deskripsi;

  Lapangan({
    required this.namaLapangan,
    required this.lokasi,
    required this.jenisLapangan,
    required this.fasilitas,
    required this.hargaPerJam,
    required this.gambar,
    required this.deskripsi,
  });
}

final List<Lapangan> lapanganItems = [
  Lapangan(
    namaLapangan: 'Lapangan Futsal Galaxy',
    lokasi: 'Jl. Mangga Dua No. 17, Jakarta',
    jenisLapangan: 'Sintetis',
    fasilitas: 'Parkir luas, ruang ganti, kantin',
    hargaPerJam: 150000,
    gambar: 'img/galaxy.jpg',
    deskripsi: 'Lapangan futsal berkualitas tinggi dengan fasilitas lengkap.',
  ),
  Lapangan(
    namaLapangan: 'Lapangan Futsal Bintang',
    lokasi: 'Jl. Bintang Raya No. 5, Bandung',
    jenisLapangan: 'Vinyl',
    fasilitas: 'WiFi gratis, ruang ganti modern',
    hargaPerJam: 120000,
    gambar: 'img/bintang.jpg',
    deskripsi: 'Lapangan futsal dengan permukaan vinyl yang nyaman.',
  ),
];