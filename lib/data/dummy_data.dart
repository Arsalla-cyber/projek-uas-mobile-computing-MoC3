// dummy_data.dart - Fixed
import '../models/models.dart';

final Map<String, String> dummyUser = {
  'name': 'Arsalla',
  'email': 'arsalla@cinego.com',
  'photo': 'https://ui-avatars.com/api/?name=Arsalla&background=random',
};

final List<Movie> dummyMovies = [
  Movie(
    id: 'm1',
    title: 'Inception',
    genre: 'Sci-Fi / Action',
    poster: 'assets/posters/inception.jpg',
    synopsis: 'Seorang pencuri profesional yang mencuri rahasia melalui alam mimpi harus menanamkan ide ke dalam pikiran seseorang.',
    duration: 148,
    rating: 8.8,
    ageRating: '13+',
    cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt'],
  ),
  Movie(
    id: 'm2',
    title: 'The Raid: Redemption',
    genre: 'Action / Crime',
    poster: 'assets/posters/the_raid.jpg',
    synopsis: 'Sebuah tim SWAT terjebak di dalam gedung apartemen yang dikuasai oleh penguasa narkoba kejam dan pasukannya.',
    duration: 101,
    rating: 8.5,
    ageRating: '17+',
    cast: ['Iko Uwais', 'Joe Taslim'],
  ),
  Movie(
    id: 'm3',
    title: 'Parasite',
    genre: 'Drama / Thriller',
    poster: 'assets/posters/parasite.jpg',
    synopsis: 'Keluarga miskin yang licik menyusup ke dalam kehidupan keluarga kaya dengan menyamar sebagai pekerja rumah tangga.',
    duration: 132,
    rating: 8.5,
    ageRating: '17+',
    cast: ['Song Kang-ho', 'Lee Sun-kyun'],
  ),
  Movie(
    id: 'm4',
    title: 'Laskar Pelangi',
    genre: 'Drama / Adventure',
    poster: 'assets/posters/laskar_pelangi.jpg',
    synopsis: 'Perjuangan sepuluh siswa dan dua guru luar biasa di Belitung dalam menembus keterbatasan ekonomi demi pendidikan.',
    duration: 125,
    rating: 8.1,
    ageRating: 'SU',
    cast: ['Zulfanny', 'Ferdian'],
  ),
  Movie(
    id: 'm5',
    title: 'Interstellar',
    genre: 'Sci-Fi / Adventure',
    poster: 'assets/posters/interstellar.jpg',
    synopsis: 'Sekelompok astronot melakukan perjalanan melalui lubang cacing untuk mencari rumah baru bagi umat manusia.',
    duration: 169,
    rating: 8.7,
    ageRating: '13+',
    cast: ['Matthew McConaughey', 'Anne Hathaway'],
  ),
];

final List<Cinema> dummyCinemas = [
  Cinema(
    id: 'c1',
    name: 'Cinema XXI Plaza Senayan',
    location: 'Jakarta Pusat',
    image: 'assets/cinemas/xxi.jpg',
    distance: 1.2,
    facilities: ['Parking', 'AC', 'Premiere Lounge'],
    badges: ['IMAX', 'Dolby Atmos'],
  ),
  Cinema(
    id: 'c2',
    name: 'CGV Grand Indonesia',
    location: 'Jakarta Pusat',
    image: 'assets/cinemas/cgv.jpg',
    distance: 2.5,
    facilities: ['Parking', 'AC', 'Gold Class'],
    badges: ['4DX', 'ScreenX'],
  ),
  Cinema(
    id: 'c3',
    name: 'Cinepolis Senayan Park',
    location: 'Jakarta Pusat',
    image: 'assets/cinemas/cinepolis.jpg',
    distance: 3.0,
    facilities: ['Parking', 'AC', 'VIP Cinema'],
    badges: ['Macro XE'],
  ),
  Cinema(
    id: 'c4',
    name: 'FLIX Cinema PIK Avenue',
    location: 'Jakarta Utara',
    image: 'assets/cinemas/flix.jpg',
    distance: 5.4,
    facilities: ['Parking', 'AC', 'Lounge'],
    badges: ['LUXE'],
  ),
];

final List<Ticket> dummyTickets = [
  Ticket(
    id: 't1',
    movie: dummyMovies[1], 
    cinema: dummyCinemas[0],
    date: '10 Jul 2026',
    time: '20:15',
    seatCount: 2,
    totalPrice: 120000,
    status: 'Upcoming',
  ),
  Ticket(
    id: 't2',
    movie: dummyMovies[4], 
    cinema: dummyCinemas[3],
    date: '08 Jul 2026',
    time: '14:00',
    seatCount: 1,
    totalPrice: 45000,
    status: 'Completed',
  ),
];
