// models.dart
// Model data bersama untuk seluruh tim.
// Jangan diubah sendiri-sendiri tanpa koordinasi — semua halaman bergantung pada struktur ini.

class Movie {
  final String id;
  final String title;
  final String genre;
  final String poster; // path asset atau URL
  final String synopsis;
  final int duration; // dalam menit
  final double rating; // 0.0 - 10.0
  final String cast; // simple string, pisahkan dengan koma

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.poster,
    required this.synopsis,
    required this.duration,
    required this.rating,
    required this.cast,
  });
}

class Cinema {
  final String id;
  final String name;
  final String location;
  final String image;
  final double distance; // dalam km, buat tampilan saja
  final List<String> facilities; // contoh: ["Parking", "AC", "Wheelchair"]

  Cinema({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.facilities,
  });
}

class Ticket {
  final Movie movie;
  final Cinema cinema;
  final String date;
  final String time;
  final int seatCount;
  final double totalPrice;
  final String status; // "Upcoming" atau "Completed"

  Ticket({
    required this.movie,
    required this.cinema,
    required this.date,
    required this.time,
    required this.seatCount,
    required this.totalPrice,
    this.status = "Upcoming",
  });
}
