// lib/widgets/poster_image.dart
//
// Widget kecil untuk menampilkan gambar poster/backdrop dari path asset lokal
// (mis. movie.poster = 'assets/images/stellar_horizon.jpg').
//
// Kalau file asset-nya belum sempat ditaruh teman-teman di folder
// assets/images/, widget ini otomatis fallback ke placeholder gradient + ikon
// film, supaya UI tetap rapi & tidak crash saat presentasi/demo.
//
// Ingat: daftar asset harus didaftarkan juga di pubspec.yaml (assets:).

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PosterImage extends StatelessWidget {
  final String assetPath;
  final BoxFit fit;

  const PosterImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (assetPath.startsWith('http')) {
      return Image.network(
        assetPath,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }
    return Image.asset(
      assetPath,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.surfaceContainerHigh,
            AppColors.surfaceContainerLowest,
          ],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: AppColors.onSurfaceVariant,
          size: 32,
        ),
      ),
    );
  }
}
