// dummy_data.dart
import '../models/models.dart';

class DummyData {
  static const Map<String, String> dummyUser = {
    'name': 'ALEX',
    'email': 'alex.design@cinego.com',
    'photo': 'https://i.pravatar.cc/150?u=alex',
  };

  static final List<Movie> dummyMovies = [
    Movie(
      id: 'm1',
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
      poster: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=500&q=80',
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
      poster: 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=500&q=80',
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
      poster: 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?w=500&q=80',
      synopsis:
          'Sekelompok mahasiswa menemukan sinyal radio misterius yang memicu serangkaian kejadian mengerikan di kampus tua mereka.',
      duration: '102m',
      ageRating: '17+',
      rating: 7.3,
      cast: 'Putri Handayani, Yoga Pradana',
    ),
  ];

  static final List<Cinema> dummyCinemas = [
    Cinema(
      id: 'c1',
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
    ),
  ];

  static final List<Ticket> dummyTickets = [
    Ticket(
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
}
