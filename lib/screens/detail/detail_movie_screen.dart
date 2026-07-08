// lib/screens/detail/detail_movie_screen.dart
//
// Halaman Detail Movie. Menerima parameter constructor `Movie movie` yang
// dioper dari MovieCard.onTap lewat Navigator + MaterialPageRoute — SESUAI
// kesepakatan tim (bukan lewat Provider/state management tambahan).
//
// Titik integrasi di halaman ini:
//  - Tap salah satu cinema di section "Available in Cinemas"
//    -> DetailCinemaScreen (dibuat Orang 3), kirim parameter `Cinema cinema`.
//  - Tombol sticky "Buy Ticket" di bawah layar
//    -> buka BuyTicketSheet (dibuat Orang 3) lewat showModalBottomSheet,
//       kirim `Movie movie` + `Cinema cinema`.
//
// Catatan desain: sesuai revisi mockup tim, kartu cinema di sini TIDAK
// menampilkan showtime (showtime baru dipilih nanti di BuyTicketSheet).
//
// Catatan asumsi: BuyTicketSheet butuh 1 objek Cinema, sedangkan tombol
// "Buy Ticket" bersifat umum (bukan per-cinema). Sebagai default, kode ini
// memakai cinema PERTAMA dari daftar "Available in Cinemas". Kalau tim mau
// user wajib pilih cinema dulu sebelum tombol ini aktif, tinggal ganti jadi
// state `_selectedCinema` yang di-update saat kartu cinema di-tap.

import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/poster_image.dart';
import '../transaction/buy_ticket_sheet.dart';
import 'detail_cinema_screen.dart';

class DetailMovieScreen extends StatefulWidget {
  final Movie movie;

  const DetailMovieScreen({super.key, required this.movie});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  bool _synopsisExpanded = false;

  void _openBuyTicketSheet(BuildContext context, Cinema cinema) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BuyTicketSheet(movie: widget.movie, cinema: cinema),
    );
  }

  void _openCinemaDetail(BuildContext context, Cinema cinema) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailCinemaScreen(cinema: cinema)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    // Section "Available in Cinemas": maksimal 5 bioskop, sesuai revisi mockup.
    final availableCinemas = DummyData.dummyCinemas.take(5).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _HeroSliverAppBar(movie: movie),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.containerPadding,
                  AppSpacing.lg,
                  AppSpacing.containerPadding,
                  120, // ruang kosong di bawah supaya tidak ketutup sticky button
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _SynopsisSection(
                      synopsis: movie.synopsis,
                      expanded: _synopsisExpanded,
                      onToggle: () => setState(() => _synopsisExpanded = !_synopsisExpanded),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    _CastSection(castCsv: movie.cast),
                    const SizedBox(height: AppSpacing.lg),
                    _CinemaListSection(
                      cinemas: availableCinemas,
                      onTapCinema: (cinema) => _openCinemaDetail(context, cinema),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          // Tombol back mengambang di atas hero image
          Positioned(
            top: MediaQuery.of(context).padding.top + AppSpacing.sm,
            left: AppSpacing.containerPadding,
            child: _GlassIconButton(
              icon: Icons.arrow_back_rounded,
              onTap: () => Navigator.maybePop(context),
            ),
          ),
          // Tombol sticky "Buy Ticket"
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _StickyBuyTicketButton(
              onTap: () => _openBuyTicketSheet(context, availableCinemas.first),
            ),
          ),
        ],
      ),
    );
  }
}

/// Hero section: poster full-bleed sebagai backdrop + judul + info inti,
/// mengikuti struktur "Title & Core Info Overlay" pada referensi Stitch.
class _HeroSliverAppBar extends StatelessWidget {
  final Movie movie;
  const _HeroSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      expandedHeight: 420,
      pinned: false,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            PosterImage(assetPath: movie.poster),
            // Gradient gelap dari bawah supaya judul tetap terbaca
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFF0A0A0B)],
                  stops: [0.3, 1.0],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.containerPadding,
                  0,
                  AppSpacing.containerPadding,
                  AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title.toUpperCase(), style: AppTextStyles.displayLg),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.unit,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _PillBadge(
                          icon: Icons.star_rounded,
                          iconColor: AppColors.gold,
                          label: movie.rating.toStringAsFixed(1),
                        ),
                        _PillBadge(icon: Icons.schedule_rounded, label: movie.duration),
                        _PillBadge(icon: Icons.shield_moon_rounded, label: movie.ageRating),
                        for (final genre in movie.genre.split(','))
                          _GenreChip(label: genre.trim()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PillBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  const _PillBadge({required this.icon, required this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor ?? AppColors.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(label, style: AppTextStyles.bodySm.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  const _GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: AppColors.onSurfaceVariant),
      ),
    );
  }
}

/// Sinopsis dengan tombol "Read More" / "Show Less" (expandable), mengikuti
/// perilaku `.synopsis-text` pada referensi Stitch.
class _SynopsisSection extends StatelessWidget {
  final String synopsis;
  final bool expanded;
  final VoidCallback onToggle;

  const _SynopsisSection({
    required this.synopsis,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Synopsis', style: AppTextStyles.titleMd),
        const SizedBox(height: AppSpacing.sm),
        Text(
          synopsis,
          style: AppTextStyles.bodyLg,
          maxLines: expanded ? null : 3,
          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: onToggle,
          style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                expanded ? 'Show Less' : 'Read More',
                style: AppTextStyles.labelCaps.copyWith(color: AppColors.primary, fontSize: 11),
              ),
              Icon(
                expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                size: 16,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Section "Top Cast" — parsing string `movie.cast` ("A, B, C") jadi daftar
/// avatar horizontal.
class _CastSection extends StatelessWidget {
  final String castCsv;
  const _CastSection({required this.castCsv});

  @override
  Widget build(BuildContext context) {
    final castNames =
        castCsv.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Cast', style: AppTextStyles.titleMd),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: castNames.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 76,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.surfaceContainer,
                      child: Icon(Icons.person, color: AppColors.onSurfaceVariant),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      castNames[index],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySm.copyWith(fontSize: 11, color: AppColors.onSurface),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Section "Available in Cinemas" — list bioskop yang tap-able.
class _CinemaListSection extends StatelessWidget {
  final List<Cinema> cinemas;
  final ValueChanged<Cinema> onTapCinema;

  const _CinemaListSection({required this.cinemas, required this.onTapCinema});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on_rounded, color: AppColors.primary, size: 20),
            const SizedBox(width: AppSpacing.sm),
            Text('Available in Cinemas', style: AppTextStyles.titleMd),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        ...cinemas.map(
          (cinema) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: InkWell(
              onTap: () => onTapCinema(cinema),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cinema.name, style: AppTextStyles.titleMd.copyWith(fontSize: 16)),
                          const SizedBox(height: 2),
                          Text('${cinema.distance} • ${cinema.location}', style: AppTextStyles.bodySm),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded, color: AppColors.onSurfaceVariant),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface.withOpacity(0.6),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Icon(icon, color: AppColors.onSurface, size: 20),
        ),
      ),
    );
  }
}

/// Tombol "Buy Ticket" yang sticky di bawah layar, dengan efek red glow
/// sesuai referensi Stitch (`primary-glow`).
class _StickyBuyTicketButton extends StatelessWidget {
  final VoidCallback onTap;
  const _StickyBuyTicketButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.containerPadding,
        AppSpacing.lg,
        AppSpacing.containerPadding,
        AppSpacing.containerPadding + MediaQuery.of(context).padding.bottom,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppColors.background],
          stops: [0.0, 0.4],
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
          elevation: 8,
          shadowColor: AppColors.primary.withOpacity(0.5),
        ),
        icon: const Icon(Icons.confirmation_number_rounded),
        label: Text('Buy Ticket', style: AppTextStyles.titleMd.copyWith(color: AppColors.onPrimary)),
      ),
    );
  }
}
