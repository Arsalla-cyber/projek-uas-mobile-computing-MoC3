// lib/screens/detail/detail_cinema_screen.dart
//
// >>> KERANGKA SEMENTARA (TITIK INTEGRASI) <<<
// File ini akan DIISI PENUH oleh ORANG 3. Kerangka ini hanya supaya
// DetailMovieScreen (milik Orang 2) bisa navigasi ke sini tanpa error
// saat develop paralel.
//
// Kontrak WAJIB (lihat tabel "Titik Integrasi" di dokumen pembagian tugas):
//   constructor menerima `Cinema cinema` — nama parameter & tipe harus
//   PERSIS seperti ini, karena dipanggil dari detail_movie_screen.dart
//   lewat Navigator.push(... DetailCinemaScreen(cinema: cinema) ...).
//
// Orang 3: silakan replace isi build() di bawah ini dengan implementasi
// asli (section "Now Showing Here" dengan 3/5 film random, dsb).
// JANGAN ubah nama class & parameter constructor tanpa koordinasi dengan
// Orang 2.

import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';

class DetailCinemaScreen extends StatelessWidget {
  final Cinema cinema;

  const DetailCinemaScreen({super.key, required this.cinema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(cinema.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            'TODO (Orang 3): Detail Cinema untuk "${cinema.name}"',
            style: const TextStyle(color: AppColors.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
