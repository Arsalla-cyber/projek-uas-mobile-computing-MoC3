<<<<<<< HEAD
﻿// lib/data/dummy_data.dart
import 'dart:math';
=======
// dummy_data.dart
>>>>>>> 809ca94 (arsalla section)
import '../models/models.dart';

class DummyData {
  static const Map<String, String> dummyUser = {
    'name': 'ALEX',
    'email': 'alex.design@cinego.com',
<<<<<<< HEAD
    'photo': 'assets/images/profile_alex.png',
=======
    'photo': 'https://i.pravatar.cc/150?u=alex',
>>>>>>> 809ca94 (arsalla section)
  };

  static final List<Movie> dummyMovies = [
    Movie(
      id: 'm1',
<<<<<<< HEAD
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
=======
      title: 'Edge of Tomorrow Reborn',
      genre: 'Sci-Fi / Action',
      poster: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500&q=80',
      synopsis:
          'Seorang tentara terjebak dalam loop waktu saat melawan invasi alien, dan harus mengulang hari yang sama untuk menemukan cara menang.',
      duration: '128m',
      ageRating: '13+',
      rating: 8.4,
      cast: 'Rian Pratama, Dinda Kirana, Farel Wibowo',
    ),
    Movie(
      id: 'm2',
      title: 'Senja di Batavia',
      genre: 'Drama / Romance',
      poster: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500&q=80',
      synopsis:
          'Kisah cinta dua sejoli di era kolonial yang terpisah oleh perang, disatukan kembali oleh sepucuk surat lama.',
      duration: '115m',
      ageRating: 'SU',
      rating: 7.9,
      cast: 'Sari Amelia, Bagus Nugraha',
    ),
    Movie(
      id: 'm3',
      title: 'The Silent Heist',
      genre: 'Thriller / Crime',
      poster: 'https://images.unsplash.com/photo-1509281373149-e957c6296406?w=500&q=80',
      synopsis:
          'Tim pencuri profesional merencanakan perampokan terbesar dalam sejarah bank digital, namun satu pengkhianat mengubah segalanya.',
      duration: '132m',
      ageRating: '17+',
      rating: 8.1,
      cast: 'Doni Saputra, Maya Lestari, Andra Wijaya',
    ),
    Movie(
      id: 'm4',
      title: 'Legenda Rimba Sunda',
      genre: 'Fantasy / Adventure',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500&q=80',
      synopsis:
          'Seorang pemuda desa menemukan warisan leluhur yang membawanya pada petualangan menyelamatkan hutan dari kekuatan gelap.',
      duration: '121m',
      ageRating: 'SU',
      rating: 7.6,
      cast: 'Reza Firmansyah, Citra Ayu',
    ),
    Movie(
      id: 'm5',
      title: 'Midnight Frequency',
      genre: 'Horror / Mystery',
      poster: 'https://images.unsplash.com/photo-1509248961158-e54f6934749c?w=500&q=80',
      synopsis:
          'Sekelompok mahasiswa menemukan sinyal radio misterius yang memicu serangkaian kejadian mengerikan di kampus tua mereka.',
      duration: '102m',
      ageRating: '17+',
      rating: 7.3,
      cast: 'Putri Handayani, Yoga Pradana',
>>>>>>> 809ca94 (arsalla section)
    ),
  ];

  static final List<Cinema> dummyCinemas = [
    Cinema(
      id: 'c1',
<<<<<<< HEAD
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
=======
      name: 'CineGo Paragon Mall',
      location: 'Jl. Pemuda No. 118, Semarang',
      image: 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=500&q=80',
      distance: 2.3,
      facilities: ['Parking', 'AC', 'Wheelchair Access'],
    ),
    Cinema(
      id: 'c2',
      name: 'CineGo Transmart',
      location: 'Jl. MT Haryono No. 858, Semarang',
      image: 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=500&q=80',
      distance: 4.1,
      facilities: ['Parking', 'AC'],
    ),
    Cinema(
      id: 'c3',
      name: 'CineGo DP Mall',
      location: 'Jl. Pemuda No. 150, Semarang',
      image: 'https://images.unsplash.com/photo-1514306191717-452ec28c7814?w=500&q=80',
      distance: 1.8,
      facilities: ['Parking', 'AC', 'Wheelchair Access', 'Food Court'],
    ),
    Cinema(
      id: 'c4',
      name: 'CineGo Citraland',
      location: 'Jl. Yos Sudarso, Semarang',
      image: 'https://images.unsplash.com/photo-1524712245354-2c4e5e7121c0?w=500&q=80',
      distance: 6.5,
      facilities: ['Parking', 'AC'],
>>>>>>> 809ca94 (arsalla section)
    ),
  ];

  static final List<Ticket> dummyTickets = [
    Ticket(
<<<<<<< HEAD
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
=======
      movie: dummyMovies[0],
      cinema: dummyCinemas[0],
      date: '05 Jul 2026',
      time: '19:30',
      seatCount: 2,
      totalPrice: 100000,
      status: 'Upcoming',
    ),
    Ticket(
      movie: dummyMovies[2],
      cinema: dummyCinemas[2],
      date: '28 Jun 2026',
      time: '16:00',
      seatCount: 1,
      totalPrice: 50000,
      status: 'Completed',
    ),
  ];
>>>>>>> 809ca94 (arsalla section)
}
