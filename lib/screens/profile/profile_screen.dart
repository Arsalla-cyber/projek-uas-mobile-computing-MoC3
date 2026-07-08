// lib/screens/profile/profile_screen.dart
//
// >>> KERANGKA SEMENTARA (TITIK INTEGRASI) <<<
// File ini akan DIISI PENUH oleh ORANG 1 (OnBoarding, Auth, Profil).
// Dibuat kosong di sini HANYA supaya HomeScreen (tab ke-4, milik Orang 2)
// bisa langsung memanggilnya tanpa error saat develop paralel.
//
// Kontrak (lihat tabel "Titik Integrasi" di dokumen pembagian tugas):
//   ProfileScreen() -> TIDAK menerima parameter apa pun.
//
// Orang 1: silakan replace isi build() di bawah ini dengan implementasi
// asli (info user, menu Purchase History -> HistoryScreen, tombol Logout).
// JANGAN ubah nama class & constructor supaya import di home_screen.dart
// tidak rusak.

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'TODO (Orang 1): Profile Screen',
        style: TextStyle(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
