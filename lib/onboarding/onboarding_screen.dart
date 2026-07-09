import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Experience the Magic',
      'subtitle': 'Book tickets for your favorite movies in seconds.',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuD2WNPZKmdTikHloQLQqFCRTGHKgEBXrEsR7Tph8psy-1LKFX6ZuApZZv1sx-flIst-VwwAAAwJBJyuh9ql5NAtxTMceklXcOJ0CacLxudiAWBOqVfsKTrGbcvwxGEyn083paz_5qEd4gcBSumKCKaZpuF7PHdkCUxnlpXl3keak0RP85NGacsuQPHF0sNJz46khGZSQGCSIRZc-q5P_e_7Cu6mvmWeu4p7LkJGSySvwQmVtltsqGc58XuSbeHVe_rDoDkr1U9GrA',
    },
    {
      'title': 'Discover Movies',
      'subtitle': 'Browse the latest blockbusters and hidden gems, all in one place.',
    },
    {
      'title': 'Book in Seconds',
      'subtitle': "Pick your seat, choose your showtime, and you're ready for the show.",
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuACZE0WXxPEm42oOAOAMLno2obzsGC4KoYJt65Xg1ec20Zd4EcYEC4_OPZGGTekNoU1UwDx3P7RWuZq_l3l_fM4SvBH9I0_K6nx4xxoOUY4vSSq-XfiIVepSPms1QAHqHq-smnR3D2Vioo3Q-DBw4UawUFJmi-p5x5T2jWVjE2uvlppZCWfxG5ZeUOevRF4DPzGkpNrzwhPQFUvfWrS2VXjQF0IkZkIlxu-VKkMbiljxRk-JgZUb0Nf0yrSpzKyY-IuWxeZWrOHoA',
    }
  ];

  // Local assets list for Page 2
  final List<String> _localPosters = [
    'assets/posters/inception.jpg',
    'assets/posters/interstellar.jpg',
    'assets/posters/laskar_pelangi.jpg',
    'assets/posters/parasite.jpg',
    'assets/posters/the_raid.jpg',
    'assets/posters/inception.jpg', // Fallback slot to fill grid
  ];

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _handleNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0B),
      body: Stack(
        children: [
          // Radial Hero Background Glow
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, -0.2),
                  radius: 0.8,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main Onboarding Slides
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return _buildPageContent(index);
            },
          ),

          // Global Header Top Action Bar (Skip Button)
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.containerPadding,
                  vertical: 8,
                ),
                child: TextButton(
                  onPressed: _navigateToLogin,
                  child: Text(
                    'SKIP',
                    style: AppTextStyles.labelCaps.copyWith(
                      color: AppColors.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Dynamic Interaction Area
          Positioned(
            left: AppSpacing.containerPadding,
            right: AppSpacing.containerPadding,
            bottom: 48,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated Page Indicator Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 8,
                      width: _currentPage == index ? 32 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primary
                            : AppColors.onSurfaceVariant,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        boxShadow: _currentPage == index
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.6),
                                  blurRadius: 8,
                                )
                              ]
                            : [],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Primary Action Glow Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 20,
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _handleNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentPage == _onboardingData.length - 1
                              ? 'GET STARTED'
                              : 'NEXT',
                          style: AppTextStyles.labelCaps.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _currentPage == _onboardingData.length - 1
                              ? Icons.chevron_right_rounded
                              : Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(int index) {
    final data = _onboardingData[index];
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.containerPadding),
        child: Column(
          children: [
            const Spacer(flex: 2),
            
            // Dynamic Illustration Layout Adjustments per page
            Expanded(
              flex: 12,
              child: index == 1 
                  ? _buildSmartphonePosterGrid() // Dedicated page 2 mockup layout
                  : _buildStandardIllustration(data['image']!, index == 0),
            ),
            
            const Spacer(flex: 1),
            
            // Typography Content block
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data['title']!,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headlineLg.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.unit * 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    data['subtitle']!,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyLg.copyWith(
                      color: AppColors.onSurfaceVariant.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildStandardIllustration(String imageUrl, bool clearFade) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        if (clearFade)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFF0A0A0B),
                  ],
                  stops: [0.6, 1.0],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSmartphonePosterGrid() {
    return Center(
      child: Container(
        width: 220,
        height: 400,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: AppColors.onSurfaceVariant, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 24,
              offset: const Offset(0, 16),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            color: AppColors.background,
            child: Stack(
              children: [
                // Render local portfolio images directly onto mobile screen context
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(6),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: _localPosters.length,
                  itemBuilder: (context, i) {
                    // Slight variation in opacities matching UI design rules
                    final double opacity = [0.8, 0.6, 0.7, 0.5, 0.9, 0.4][i % 6];
                    return Opacity(
                      opacity: opacity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          _localPosters[i],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Container fallback if local image bundle assets aren't added yet
                            return Container(color: AppColors.onSurfaceVariant);
                          },
                        ),
                      ),
                    );
                  },
                ),
                // Internal dynamic gradient layer
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.primary.withValues(alpha: 0.15),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}