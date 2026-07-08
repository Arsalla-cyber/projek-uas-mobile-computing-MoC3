// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/movie_card.dart';
import '../profile/profile_screen.dart';
import 'tab_cinema_list.dart';
import 'tab_movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: _currentTab,
          children: [
            _TabHomeContent(onSeeAllMovies: () => setState(() => _currentTab = 1)),
            const TabMovieList(),
            const TabCinemaList(),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: _CineGoBottomNav(
        currentIndex: _currentTab,
        onTap: (index) => setState(() => _currentTab = index),
      ),
    );
  }
}

class _TabHomeContent extends StatelessWidget {
  final VoidCallback onSeeAllMovies;

  const _TabHomeContent({required this.onSeeAllMovies});

  @override
  Widget build(BuildContext context) {
    final List<Movie> nowShowing = DummyData.dummyMovies.take(2).toList();
    final List<Movie> allMovies = DummyData.dummyMovies;

    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.containerPadding,
            AppSpacing.md,
            AppSpacing.containerPadding,
            0,
          ),
          sliver: SliverToBoxAdapter(child: _GreetingHeader()),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          sliver: SliverToBoxAdapter(
            child: _SectionNowShowing(
              movies: nowShowing,
              onSeeAll: onSeeAllMovies,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.containerPadding,
            0,
            AppSpacing.containerPadding,
            AppSpacing.lg,
          ),
          sliver: SliverToBoxAdapter(
            child: _SectionAllMovies(movies: allMovies),
          ),
        ),
      ],
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    final userName = DummyData.dummyUser['name'] ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back', style: AppTextStyles.bodySm),
            const SizedBox(height: 2),
            Text('Hi, $userName', style: AppTextStyles.headlineLg),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.surfaceContainer,
          backgroundImage: DummyData.dummyUser['photo']!.startsWith('http')
              ? NetworkImage(DummyData.dummyUser['photo']!)
              : AssetImage(DummyData.dummyUser['photo']!) as ImageProvider,
          onBackgroundImageError: (_, __) {},
          child: DummyData.dummyUser['photo'] == null
              ? const Icon(Icons.person, color: AppColors.onSurfaceVariant)
              : null,
        ),
      ],
    );
  }
}

class _SectionNowShowing extends StatelessWidget {
  final List<Movie> movies;
  final VoidCallback onSeeAll;

  const _SectionNowShowing({required this.movies, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Now Showing', style: AppTextStyles.titleMd),
              GestureDetector(
                onTap: onSeeAll,
                child: Text(
                  'See All',
                  style: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
            itemCount: movies.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              return MovieCard(movie: movies[index], variant: MovieCardVariant.poster);
            },
          ),
        ),
      ],
    );
  }
}

class _SectionAllMovies extends StatelessWidget {
  final List<Movie> movies;
  const _SectionAllMovies({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('All Movies', style: AppTextStyles.titleMd),
        const SizedBox(height: AppSpacing.md),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, index) {
            return MovieCard(movie: movies[index], variant: MovieCardVariant.list);
          },
        ),
      ],
    );
  }
}

class _CineGoBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _CineGoBottomNav({required this.currentIndex, required this.onTap});

  static const List<({IconData icon, String label})> _items = [
    (icon: Icons.home_rounded, label: 'Home'),
    (icon: Icons.movie_rounded, label: 'Movies'),
    (icon: Icons.theaters_rounded, label: 'Cinema'),
    (icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.92),
        border: const Border(top: BorderSide(color: AppColors.borderSubtle)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isActive = index == currentIndex;
              final color = isActive ? AppColors.primary : AppColors.onSurfaceVariant;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, color: color, size: 24),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: AppTextStyles.labelCaps.copyWith(color: color, fontSize: 10),
                      ),
                      if (isActive) ...[
                        const SizedBox(height: 2),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
