import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../widgets/cinema_card.dart';
import '../detail/detail_cinema_screen.dart';

/// Tab "Cinema" di BottomNav Beranda.
/// Widget ini diimpor Orang 2 ke home_screen.dart.
class TabCinemaList extends StatelessWidget {
  const TabCinemaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white38, size: 20),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search cinemas, locations...',
                          hintStyle: TextStyle(color: Colors.white38),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.tune, color: Colors.white38, size: 20),
                  ],
                ),
              ),
            ),
            // Filter chip
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _FilterChip(label: 'Premium IMAX', selected: true),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // List cinema
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: dummyCinemas.length,
                itemBuilder: (context, index) {
                  final cinema = dummyCinemas[index];
                  return CinemaCard(
                    cinema: cinema,
                    onSelect: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailCinemaScreen(cinema: cinema),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFF5C518) : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
