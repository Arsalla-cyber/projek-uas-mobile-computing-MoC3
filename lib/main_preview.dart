import 'package:flutter/material.dart';
import 'screens/home/tab_cinema_list.dart';
import 'screens/detail/detail_cinema_screen.dart';
import 'screens/transaction/buy_ticket_sheet.dart';
import 'screens/transaction/history_screen.dart';
import 'data/dummy_data.dart';

/// main.dart SEMENTARA — hanya untuk preview UI Orang 3.
/// Nanti kalau sudah masuk tahap integrasi, file ini akan
/// digantikan main.dart asli dari hasil merge semua orang
/// (mulai dari OnBoarding/Login, bukan langsung ke sini).
void main() {
  runApp(const PreviewApp());
}

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineGo — Preview Orang 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        fontFamily: 'Roboto',
      ),
      home: const PreviewMenu(),
    );
  }
}

/// Menu pemilih — supaya kamu bisa loncat langsung ke screen
/// mana pun tanpa perlu navigasi asli dulu.
class PreviewMenu extends StatelessWidget {
  const PreviewMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        title: const Text('Preview — Orang 3',
            style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _PreviewButton(
            label: 'Tab List Cinema',
            onTap: (context) => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TabCinemaList()),
            ),
          ),
          _PreviewButton(
            label: 'Detail Cinema',
            onTap: (context) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailCinemaScreen(cinema: dummyCinemas[0]),
              ),
            ),
          ),
          _PreviewButton(
            label: 'BottomSheet Beli Tiket',
            onTap: (context) => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BuyTicketSheet(
                movie: dummyMovies[0],
                cinema: dummyCinemas[0],
              ),
            ),
          ),
          _PreviewButton(
            label: 'Riwayat Pembelian',
            onTap: (context) => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HistoryScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewButton extends StatelessWidget {
  final String label;
  final void Function(BuildContext context) onTap;

  const _PreviewButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: ElevatedButton(
        onPressed: () => onTap(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A1A1A),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.centerLeft,
        ),
        child: Text(label),
      ),
    );
  }
}
