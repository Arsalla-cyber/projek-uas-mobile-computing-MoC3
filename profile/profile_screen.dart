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
import '../../data/dummy_data.dart';
import '../auth/login_screen.dart';
import '../transaction/history_screen.dart'; 

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.dummyUser;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppTextStyles.headlineLg.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.containerPadding,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar Section
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        user['photo'] ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.surfaceContainer,
                            child: const Icon(
                              Icons.person_rounded,
                              size: 48,
                              color: AppColors.onSurfaceVariant,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.background,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            
            // Name and Email
            Text(
              user['name'] ?? 'USER',
              style: AppTextStyles.displayLg.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 4),
            Text(
              user['email'] ?? 'user@cinego.com',
              style: AppTextStyles.bodyLg,
            ),
            const SizedBox(height: AppSpacing.lg * 1.5),

            // Profile Options Menu (Glassmorphism look)
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                children: [
                  _buildProfileOption(
                    context,
                    icon: Icons.history_rounded,
                    title: 'Purchase History',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Account Settings',
                    onTap: () {}, // Dummy action
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    context,
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    onTap: () {}, // Dummy action
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    context,
                    icon: Icons.lock_outline_rounded,
                    title: 'Privacy',
                    onTap: () {}, // Dummy action
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Logout Button
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: _buildProfileOption(
                context,
                icon: Icons.logout_rounded,
                title: 'Logout',
                titleColor: AppColors.primary,
                iconColor: AppColors.primary,
                showTrailing: false,
                onTap: () {
                  // Logout logic: Clear navigation stack and go to Login
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            
            const SizedBox(height: 100), // Padding to account for the bottom nav bar space
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? titleColor,
    Color? iconColor,
    bool showTrailing = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 16,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.onSurfaceVariant,
              size: 24,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.titleMd.copyWith(
                  color: titleColor ?? AppColors.onSurface,
                ),
              ),
            ),
            if (showTrailing)
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.onSurfaceVariant,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.borderSubtle,
      indent: 56, // Align with text start
    );
  }
}
