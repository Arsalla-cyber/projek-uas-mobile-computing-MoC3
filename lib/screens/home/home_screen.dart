import 'dart:async';
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
    final List<Movie> nowShowing = dummyMovies.take(2).toList();
    final List<Movie> allMovies = dummyMovies;

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
        const SliverPadding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
          sliver: SliverToBoxAdapter(child: _BannerSlider()),
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
    final userName = dummyUser['name'] ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: AppTextStyles.bodySm),
              const SizedBox(height: 2),
              Text(
                'Hi, $userName',
                style: AppTextStyles.headlineLg,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.surfaceContainer,
          backgroundImage: dummyUser['photo']!.startsWith('http')
              ? NetworkImage(dummyUser['photo']!)
              : AssetImage(dummyUser['photo']!) as ImageProvider,
          onBackgroundImageError: (_, __) {},
          child: dummyUser['photo'] == null
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
        const _FilterChipsSection(),
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

class _BannerSlider extends StatefulWidget {
  const _BannerSlider();

  @override
  State<_BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<_BannerSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> banners = [
    {
      'image': 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=800&q=80',
      'title': 'Buy 1 Get 1 Free!',
      'subtitle': 'Valid for all movies on weekends'
    },
    {
      'image': 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=800&q=80',
      'title': 'Popcorn & Soda Combo',
      'subtitle': 'Only \$5 with any ticket purchase'
    },
    {
      'image': 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=800&q=80',
      'title': 'New Member Discount',
      'subtitle': 'Get 20% off on your first ticket'
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        if (_currentPage < banners.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutQuart,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return GestureDetector(
            onPanDown: (_) => _timer?.cancel(), // Stop auto-slide saat disentuh
            onPanEnd: (_) => _startAutoSlide(), // Mulai lagi setelah dilepas
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                image: DecorationImage(
                  image: NetworkImage(banner['image']!),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    banner['title']!,
                    style: AppTextStyles.headlineLg.copyWith(fontSize: 24, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    banner['subtitle']!,
                    style: AppTextStyles.bodySm.copyWith(color: Colors.white70),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              ),
            );
        },
      ),
    );
  }
}

class _FilterChipsSection extends StatefulWidget {
  const _FilterChipsSection();

  @override
  State<_FilterChipsSection> createState() => _FilterChipsSectionState();
}

class _FilterChipsSectionState extends State<_FilterChipsSection> {
  int _selectedIndex = 0;
  final List<String> _filters = ['All', 'Action', 'Sci-Fi', 'Drama', 'Fantasy', 'Horror'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return ChoiceChip(
            label: Text(_filters[index]),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.surfaceContainer,
            labelStyle: AppTextStyles.labelCaps.copyWith(
              color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
              fontSize: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.full),
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.borderSubtle,
              ),
            ),
            showCheckmark: false,
          );
        },
      ),
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
