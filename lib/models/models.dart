class Movie {
  final String id;
  final String title;
  final String genre;
  final String poster;
  final String synopsis;
  final String duration;
  final String ageRating;
  final double rating;
  final String cast;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.poster,
    required this.synopsis,
    required this.duration,
    required this.ageRating,
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
