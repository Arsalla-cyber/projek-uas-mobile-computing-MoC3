// models.dart
// Model data bersama untuk seluruh tim (Orang 1, 2, 3).
//
// ATURAN PENTING:
// - Jangan diubah sendiri-sendiri tanpa koordinasi ke grup — semua
//   halaman di semua orang bergantung pada struktur & TIPE DATA ini persis.
// - Kalau ada field baru yang dibutuhkan, tambahkan di sini dulu,
//   push, baru semua orang pull sebelum lanjut kerja.
// - JANGAN ubah tipe data field yang sudah ada (misal duration dari int
//   jadi String) tanpa memberi tahu semua orang, karena akan bikin error
//   compile di file siapa pun yang sudah memakainya.

class Movie {
  final String id;
  final String title;
  final String genre;
  final String poster; // path asset ("assets/posters/xxx.jpg") ATAU URL (https://...)
  final String synopsis;
  final int duration; // dalam MENIT, contoh: 128 (BUKAN "128 menit")
  final double rating; // skala 0.0 - 10.0
  final String ageRating; // contoh: "R", "13+", "17+", "SU"
  final List<String> cast; // list nama aktor, contoh: ["Rian Pratama", "Dinda Kirana"]

  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.poster,
    required this.synopsis,
    required this.duration,
    required this.rating,
    required this.ageRating,
    required this.cast,
  });

  /// Format durasi jadi "2h 8m" untuk ditampilkan di UI.
  /// Dipakai supaya tidak ada yang hardcode teks durasi manual.
  String get durationLabel {
    final h = duration ~/ 60;
    final m = duration % 60;
    if (h == 0) return '${m}m';
    if (m == 0) return '${h}h';
    return '${h}h ${m}m';
  }
}

class Cinema {
  final String id;
  final String name;
  final String location;
  final String image; // path asset ("assets/cinemas/xxx.jpg") ATAU URL (https://...)
  final double distance; // dalam KM, contoh: 2.3 (untuk tampilan saja, bukan hasil hitung GPS asli)
  final List<String> facilities; // contoh: ["Parking", "AC", "Wheelchair Access", "Food Court"]
  final List<String> badges; // contoh: ["IMAX", "VIP"], boleh kosong []

  const Cinema({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.facilities,
    this.badges = const [],
  });
}

class Ticket {
  final String id;
  final Movie movie;
  final Cinema cinema;
  final String date; // contoh: "MON 22" atau "05 Jul 2026" — format bebas, tampilan saja
  final String time; // contoh: "17:30"
  final int seatCount;
  final double totalPrice;
  final String status; // "Upcoming" atau "Completed"

  const Ticket({
    required this.id,
    required this.movie,
    required this.cinema,
    required this.date,
    required this.time,
    required this.seatCount,
    required this.totalPrice,
    this.status = 'Upcoming',
  });
}
