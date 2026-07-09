import 'package:flutter/material.dart';

/// Widget gambar pintar: otomatis pilih Image.network kalau path berupa
/// URL (http/https), atau Image.asset kalau path lokal (assets/...).
/// Kalau gagal load / path kosong, tampilkan placeholder ikon.
///
/// Dipakai di semua tempat yang menampilkan poster film / foto bioskop,
/// supaya tidak perlu tulis ulang logic if-else di tiap file.
class SmartImage extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final IconData placeholderIcon;

  const SmartImage({
    super.key,
    required this.path,
    this.fit = BoxFit.cover,
    this.placeholderIcon = Icons.image_not_supported,
  });

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) return _placeholder();

    final isNetwork = path.startsWith('http://') || path.startsWith('https://');

    return isNetwork
        ? Image.network(
            path,
            fit: fit,
            errorBuilder: (_, __, ___) => _placeholder(),
          )
        : Image.asset(
            path,
            fit: fit,
            errorBuilder: (_, __, ___) => _placeholder(),
          );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey[900],
      alignment: Alignment.center,
      child: Icon(placeholderIcon, color: Colors.white24, size: 32),
    );
  }
}
