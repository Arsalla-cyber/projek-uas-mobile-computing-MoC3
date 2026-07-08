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
    required this.duration,
    required this.ageRating,
    required this.rating,
    required this.ageRating,
    required this.poster,
    required this.synopsis,
    required this.cast,
  });
}

class Cinema {
  final String id;
  final String name;
  final String location;
  final String address;
  final String distance;
  final List<String> facilities;

  Cinema({
    required this.id,
    required this.name,
    required this.location,
    required this.address,
    required this.distance,
    required this.facilities,
  });
}

class Ticket {
  final String id;
  final String movieTitle;
  final String cinemaName;
  final String date;
  final String showtime;
  final int seatCount;
  final double totalPrice;
  final String status;

  Ticket({
    required this.id,
    required this.movieTitle,
    required this.cinemaName,
    required this.date,
    required this.showtime,
    required this.seatCount,
    required this.totalPrice,
    required this.status,
  });
}
