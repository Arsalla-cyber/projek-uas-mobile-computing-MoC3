import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/detail/detail_movie_screen.dart';
import '../theme/app_theme.dart';
import 'poster_image.dart';

enum MovieCardVariant {
  poster,
  list,
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  final MovieCardVariant variant;

  const MovieCard({
    super.key,
    required this.movie,
    this.variant = MovieCardVariant.list,
  });

  void _openDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => DetailMovieScreen(movie: movie)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openDetail(context),
      child: variant == MovieCardVariant.poster
          ? _PosterCard(movie: movie)
          : _ListCard(movie: movie),
    );
  }
}

/// Kartu vertikal 2:3 dengan gradient overlay di bawah untuk judul/rating —
/// dipakai di section "Now Showing" (horizontal scroll).
class _PosterCard extends StatelessWidget {
  final Movie movie;
  const _PosterCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PosterImage(assetPath: movie.poster),

            // Gradient gelap dari bawah supaya teks tetap terbaca di atas poster
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xE60A0A0B)],
                  stops: [0.4, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _RatingBadge(rating: movie.rating),
                      const SizedBox(width: AppSpacing.unit),
                      Flexible(child: _GhostChip(label: movie.genre)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.unit),
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleMd,
                  ),
                  Text("${movie.duration}", style: AppTextStyles.bodySm),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Kartu horizontal
/// "All Movies" dan tab "Movies".
class _ListCard extends StatelessWidget {
  final Movie movie;
  const _ListCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: SizedBox(
              width: 72,
              height: 108, // rasio 2:3
              child: PosterImage(assetPath: movie.poster),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.titleMd,
                ),
                const SizedBox(height: AppSpacing.unit),
                Text(
                  '${movie.genre} • ${movie.duration}m',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySm,
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    _AgeRatingChip(label: movie.ageRating),
                    const SizedBox(width: AppSpacing.sm),
                    const Icon(Icons.star_rounded, size: 14, color: AppColors.gold),
                    const SizedBox(width: 2),
                    Text(
                      movie.rating.toStringAsFixed(1),
                      style: AppTextStyles.labelCaps.copyWith(
                        color: AppColors.gold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 12, color: AppColors.gold),
          const SizedBox(width: 2),
          Text(rating.toStringAsFixed(1), style: AppTextStyles.labelCaps.copyWith(fontSize: 10)),
        ],
      ),
    );
  }
}

class _GhostChip extends StatelessWidget {
  final String label;
  const _GhostChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.labelCaps.copyWith(fontSize: 10),
      ),
    );
  }
}

class _AgeRatingChip extends StatelessWidget {
  final String label;
  const _AgeRatingChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderSubtle),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(label, style: AppTextStyles.labelCaps.copyWith(fontSize: 9)),
    );
  }
}
