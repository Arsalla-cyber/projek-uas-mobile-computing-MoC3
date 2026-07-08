// lib/screens/home/tab_cinema_list.dart
//
// >>> KERANGKA SEMENTARA (TITIK INTEGRASI) <<<
// File ini akan DIISI PENUH oleh ORANG 3 (List Cinema, Detail Cinema,
// Transaksi, Riwayat). Dibuat kosong di sini HANYA supaya HomeScreen
// (tab ke-3, milik Orang 2) bisa langsung memanggilnya tanpa error saat
// develop paralel.
//
// Kontrak (lihat tabel "Titik Integrasi" di dokumen pembagian tugas):
//   TabCinemaList() -> TIDAK menerima parameter apa pun.
//
// Orang 3: silakan replace isi build() di bawah ini dengan implementasi
// asli (list vertical dummyCinemas, onTap -> DetailCinemaScreen(cinema)).
// JANGAN ubah nama class & constructor supaya import di home_screen.dart
// tidak rusak.

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class TabCinemaList extends StatelessWidget {
  const TabCinemaList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'TODO (Orang 3): Tab Cinema List',
        style: TextStyle(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
