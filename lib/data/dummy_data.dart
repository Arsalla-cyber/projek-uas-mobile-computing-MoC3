// dummy_data.dart
// Data statis bersama. Semua orang import file ini supaya poster/nama
// yang muncul di List sama persis dengan yang muncul di Detail.
//
// PENTING: Kalau butuh tambah data, tambahkan di sini saja lalu push,
// jangan bikin dummy data sendiri-sendiri di file lain.

import '../models/models.dart';

final List<Movie> dummyMovies = [
  Movie(
    id: 'm1',
    title: 'Edge of Tomorrow Reborn',
    genre: 'Sci-Fi / Action',
    poster: 'assets/posters/movie1.jpg',
    synopsis:
        'Seorang tentara terjebak dalam loop waktu saat melawan invasi alien, dan harus mengulang hari yang sama untuk menemukan cara menang.',
    duration: 128,
    rating: 8.4,
    cast: 'Rian Pratama, Dinda Kirana, Farel Wibowo',
  ),
  Movie(
    id: 'm2',
    title: 'Senja di Batavia',
    genre: 'Drama / Romance',
    poster: 'assets/posters/movie2.jpg',
    synopsis:
        'Kisah cinta dua sejoli di era kolonial yang terpisah oleh perang, disatukan kembali oleh sepucuk surat lama.',
    duration: 115,
    rating: 7.9,
    cast: 'Sari Amelia, Bagus Nugraha',
  ),
  Movie(
    id: 'm3',
    title: 'The Silent Heist',
    genre: 'Thriller / Crime',
    poster: 'assets/posters/movie3.jpg',
    synopsis:
        'Tim pencuri profesional merencanakan perampokan terbesar dalam sejarah bank digital, namun satu pengkhianat mengubah segalanya.',
    duration: 132,
    rating: 8.1,
    cast: 'Doni Saputra, Maya Lestari, Andra Wijaya',
  ),
  Movie(
    id: 'm4',
    title: 'Legenda Rimba Sunda',
    genre: 'Fantasy / Adventure',
    poster: 'assets/posters/movie4.jpg',
    synopsis:
        'Seorang pemuda desa menemukan warisan leluhur yang membawanya pada petualangan menyelamatkan hutan dari kekuatan gelap.',
    duration: 121,
    rating: 7.6,
    cast: 'Reza Firmansyah, Citra Ayu',
  ),
  Movie(
    id: 'm5',
    title: 'Midnight Frequency',
    genre: 'Horror / Mystery',
    poster: 'assets/posters/movie5.jpg',
    synopsis:
        'Sekelompok mahasiswa menemukan sinyal radio misterius yang memicu serangkaian kejadian mengerikan di kampus tua mereka.',
    duration: 102,
    rating: 7.3,
    cast: 'Putri Handayani, Yoga Pradana',
  ),
];

final List<Cinema> dummyCinemas = [
  Cinema(
    id: 'c1',
    name: 'CineGo Paragon Mall',
    location: 'Jl. Pemuda No. 118, Semarang',
    image: 'assets/cinemas/cinema1.jpg',
    distance: 2.3,
    facilities: ['Parking', 'AC', 'Wheelchair Access'],
  ),
  Cinema(
    id: 'c2',
    name: 'CineGo Transmart',
    location: 'Jl. MT Haryono No. 858, Semarang',
    image: 'assets/cinemas/cinema2.jpg',
    distance: 4.1,
    facilities: ['Parking', 'AC'],
  ),
  Cinema(
    id: 'c3',
    name: 'CineGo DP Mall',
    location: 'Jl. Pemuda No. 150, Semarang',
    image: 'assets/cinemas/cinema3.jpg',
    distance: 1.8,
    facilities: ['Parking', 'AC', 'Wheelchair Access', 'Food Court'],
  ),
  Cinema(
    id: 'c4',
    name: 'CineGo Citraland',
    location: 'Jl. Yos Sudarso, Semarang',
    image: 'assets/cinemas/cinema4.jpg',
    distance: 6.5,
    facilities: ['Parking', 'AC'],
  ),
];

// Riwayat pembelian tiket (opsional, untuk halaman ke-7)
final List<Ticket> dummyTickets = [
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
