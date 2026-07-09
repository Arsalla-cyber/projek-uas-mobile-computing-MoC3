import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/movie_card.dart';
class TabMovieList extends StatelessWidget {
  const TabMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = dummyMovies;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.containerPadding,
        AppSpacing.md,
        AppSpacing.containerPadding,
        AppSpacing.lg,
      ),
      itemCount: movies.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index], variant: MovieCardVariant.list);
      },
    );
  }
}
