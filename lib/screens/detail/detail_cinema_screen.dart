import 'dart:math';
import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../models/models.dart';
import '../../widgets/smart_image.dart';
import 'detail_movie_screen.dart';

/// Terima parameter [cinema] dari halaman sebelumnya (List Cinema
/// atau dari Detail Movie milik Orang 2).
class DetailCinemaScreen extends StatefulWidget {
  final Cinema cinema;

  const DetailCinemaScreen({super.key, required this.cinema});

  @override
  State<DetailCinemaScreen> createState() => _DetailCinemaScreenState();
}

class _DetailCinemaScreenState extends State<DetailCinemaScreen> {
  // Ditentukan sekali saat halaman dibuka (initState), supaya jumlah
  // dan daftar film tidak berubah-ubah setiap kali widget di-rebuild.
  late final List<Movie> _shownMovies;

  @override
  void initState() {
    super.initState();
    final rnd = Random();
    final count = rnd.nextBool() ? 3 : 5; // pilih 3 ATAU 5 film
    final shuffled = List<Movie>.from(dummyMovies)..shuffle(rnd);
    _shownMovies = shuffled.take(count).toList();
  }

  Cinema get cinema => widget.cinema;

  @override
  Widget build(BuildContext context) {
    final List<Movie> shownMovies = _shownMovies;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: CustomScrollView(
        slivers: [
          // Banner + tombol back
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: SmartImage(
                    path: cinema.image,
                    placeholderIcon: Icons.local_movies,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: SafeArea(
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Badge
                Wrap(
                  spacing: 8,
                  children: const [
                    _Badge(text: 'IMAX', color: Color(0xFFF5C518)),
                    _Badge(text: 'VIP', color: Colors.white24),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  cinema.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: Colors.white38, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        cinema.location,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Fasilitas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: cinema.facilities
                      .map((f) => _FacilityColumn(label: f))
                      .toList(),
                ),
                const SizedBox(height: 28),
                // Now Showing Here
                Row(
                  children: const [
                    Icon(Icons.local_activity,
                        color: Color(0xFFE31E24), size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Now Showing Here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shownMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    final movie = shownMovies[index];
                    return _MiniMovieCard(
                      movie: movie,
                      onTap: () {
                        // NOTE: DetailMovieScreen saat ini masih file STUB.
                        // Saat Orang 2 selesai, tinggal timpa file stub itu
                        // dengan hasil aslinya — baris di bawah TIDAK perlu
                        // diubah lagi (constructor `movie` sudah sesuai
                        // kesepakatan Titik Integrasi).
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailMovieScreen(movie: movie),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 90),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;
  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text,
          style: TextStyle(
              color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

class _FacilityColumn extends StatelessWidget {
  final String label;
  const _FacilityColumn({required this.label});

  IconData get _icon {
    switch (label.toLowerCase()) {
      case 'parking':
        return Icons.local_parking;
      case 'ac':
        return Icons.ac_unit;
      case 'wheelchair access':
        return Icons.accessible;
      case 'food court':
        return Icons.fastfood;
      default:
        return Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white.withOpacity(0.06),
          child: Icon(_icon, color: const Color(0xFFE31E24), size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ],
    );
  }
}

class _MiniMovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  const _MiniMovieCard({required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SmartImage(
                    path: movie.poster,
                    placeholderIcon: Icons.movie,
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5C518),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      movie.rating.toStringAsFixed(1),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Text(
            movie.genre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white38, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
