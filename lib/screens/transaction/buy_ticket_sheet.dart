// lib/screens/transaction/buy_ticket_sheet.dart
//
// >>> KERANGKA SEMENTARA (TITIK INTEGRASI) <<<
// File ini akan DIISI PENUH oleh ORANG 3. Kerangka ini hanya supaya
// tombol sticky "Buy Ticket" di DetailMovieScreen (milik Orang 2) bisa
// memanggil BuyTicketSheet tanpa error saat develop paralel.
//
// Kontrak WAJIB (lihat tabel "Titik Integrasi" di dokumen pembagian tugas):
//   constructor menerima `Movie movie` + `Cinema cinema` — nama parameter
//   & tipe harus PERSIS seperti ini, karena dipanggil dari
//   detail_movie_screen.dart lewat showModalBottomSheet().
//
// Orang 3: silakan replace isi build() di bawah ini dengan implementasi
// asli (date picker, showtime chip, stepper kursi, total harga, tombol
// Confirm Booking yang membuat objek Ticket baru).
// JANGAN ubah nama class & parameter constructor tanpa koordinasi dengan
// Orang 2.

import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';

class BuyTicketSheet extends StatelessWidget {
  final Movie movie;
  final Cinema cinema;

  const BuyTicketSheet({super.key, required this.movie, required this.cinema});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('TODO (Orang 3): Buy Ticket Sheet', style: AppTextStyles.titleMd),
          const SizedBox(height: AppSpacing.sm),
          Text('Movie: ${movie.title}', style: AppTextStyles.bodySm),
          Text('Cinema: ${cinema.name}', style: AppTextStyles.bodySm),
        ],
      ),
    );
  }
}
