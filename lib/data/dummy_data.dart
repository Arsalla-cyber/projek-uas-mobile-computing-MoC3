// lib/data/dummy_data.dart
import 'dart:math';
import '../models/models.dart';

class DummyData {
  static const Map<String, String> dummyUser = {
    'name': 'ALEX',
    'email': 'alex.design@cinego.com',
    'photo': 'assets/images/profile_alex.png',
  };

  static final List<Movie> dummyMovies = [
    Movie(
      id: 'm1',
      title: 'Stellar Horizon',
      genre: 'Sci-Fi',
      duration: '2h 15m',
      rating: 4.8,
      ageRating: '12+',
      poster: 'assets/images/stellar_horizon.jpg',
      synopsis: 'In the year 2154, amidst the sprawling neon-drenched metropolis of Neo-Veridia, a rogue AI begins to awaken ancient, dormant technologies...',
      cast: 'Idris Elba, Charlize Theron, Cillian Murphy, Anya Taylor-Joy',
    ),
    Movie(
      id: 'm2',
      title: 'Velocity',
      genre: 'Action',
      duration: '1h 58m',
      rating: 4.5,
      ageRating: '15+',
      poster: 'assets/images/velocity.jpg',
      synopsis: 'A high-octane race through underground circuits where individual freedom is the ultimate price.',
      cast: 'Paul Walker Clone, Vin Diesel, Michelle R.',
    ),
    Movie(
      id: 'm3',
      title: 'Crimson Petals',
      genre: 'Drama',
      duration: '1h 45m',
      rating: 4.1,
      ageRating: '15+',
      poster: 'assets/images/crimson_petals.jpg',
      synopsis: 'An emotional exploration of memories and lost love set against a scenic floral backdrop.',
      cast: 'Emma Stone, Ryan Gosling',
    ),
    Movie(
      id: 'm4',
      title: 'Tower of Shadows',
      genre: 'Fantasy',
      duration: '2h 30m',
      rating: 4.9,
      ageRating: '12+',
      poster: 'assets/images/tower_of_shadows.jpg',
      synopsis: 'A young mage climbs a cursed monolith to shatter the eternal twilight binding her kingdom.',
      cast: 'Timothée Chalamet, Zendaya',
    ),
    Movie(
      id: 'm5',
      title: 'The Silicon Mind',
      genre: 'Documentary',
      duration: '1h 20m',
      rating: 3.8,
      ageRating: 'All',
      poster: 'assets/images/silicon_mind.jpg',
      synopsis: 'An inside look at the exponential growth of neural networks and how they shape modern human choices.',
      cast: 'Alan Turing AI, Tech Pioneers',
    ),
    Movie(
      id: 'm6',
      title: 'Neon Mirage',
      genre: 'Sci-Fi, Action',
      duration: '2h 22m',
      rating: 8.0,
      ageRating: '15+',
      poster: 'assets/images/neon_mirage.jpg',
      synopsis: 'A cyberpunk operative uncovers that the city they protect is completely simulated.',
      cast: 'Keanu Reeves, Carrie-Anne Moss',
    ),
  ];

  static final List<Cinema> dummyCinemas = [
    Cinema(
      id: 'c1',
      name: 'Starlight Grand Cinemas',
      location: 'Downtown District',
      address: '1240 Neo Metropolis Blvd, Sector 7',
      distance: '1.2 km',
      facilities: ['Parking', 'Cafe', 'Access', 'Lounge'],
    ),
    Cinema(
      id: 'c2',
      name: 'Grand Galaxy IMAX',
      location: 'Northside Mall',
      address: 'Northside Mall, 3rd Floor',
      distance: '3.8 km',
      facilities: ['Parking', 'IMAX', 'Access'],
    ),
    Cinema(
      id: 'c3',
      name: 'Silver Screen Cinemas',
      location: 'West End',
      address: 'West End Plaza, Block B',
      distance: '0.5 km',
      facilities: ['Parking', 'Access'],
    ),
    Cinema(
      id: 'c4',
      name: 'Starlight Multiplex',
      location: 'Metro Center',
      address: 'Downtown Avenue, Metro Center',
      distance: '2.4 km',
      facilities: ['Parking', 'Cafe', 'Lounge'],
    ),
  ];

  static final List<Ticket> dummyTickets = [
    Ticket(
      id: 't1',
      movieTitle: 'Neon Mirage',
      cinemaName: 'Starlight Theater - IMAX',
      date: 'Oct 24, 2024',
      showtime: '8:50 PM',
      seatCount: 2,
      totalPrice: 36.00,
      status: 'Upcoming',
    ),
    Ticket(
      id: 't2',
      movieTitle: 'The Silicon Mind',
      cinemaName: 'Grand Horizon Cinema',
      date: 'Sep 12, 2024',
      showtime: '6:15 PM',
      seatCount: 1,
      totalPrice: 18.00,
      status: 'Completed',
    ),
    Ticket(
      id: 't3',
      movieTitle: 'Midnight Echoes',
      cinemaName: 'Downtown Independent',
      date: 'Aug 05, 2024',
      showtime: '9:45 PM',
      seatCount: 1,
      totalPrice: 15.00,
      status: 'Completed',
    ),
  ];

  static List<Movie> getRandomMoviesForCinema() {
    final random = Random();
    int count = random.nextBool() ? 3 : 5;
    List<Movie> shuffledMovies = List.from(dummyMovies)..shuffle(random);
    return shuffledMovies.take(count).toList();
  }
}
