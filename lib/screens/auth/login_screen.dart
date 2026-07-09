import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../home/home_screen.dart';
import 'register_screen.dart';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Navigate to Home Screen and clear navigation stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Cinematic Background
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -1.0),
                radius: 1.5,
                colors: [
                  AppColors.primary.withValues(alpha: 0.15),
                  AppColors.background,
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDdQz1zUss-BS_o6mgZlr7cw64BNmBoW7nPvi-HbJBJVtF9hT0kF6gid8lhRSR7Icao1tWA8XuYTJ4kK2kBuxcfr9b1vumuKCLhI6ia7iAs-b_cBB5_oxi7_9VDeaVMwRzQdjblQ7ZEV_-tF3vRMnqDGF5EhE7XS5onyX3c3yTCrHL4wDa8F5eI1yq5QUd8jwW4_IhfOAT7yl4BBFmmBmckH8wL__a8zYM8y-QevRkAtp9AGnEm2v5G-NHcwfBU0la-c4qxI4ZUgg',
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.overlay,
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.containerPadding),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header
                        Text(
                          'CineGo',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.displayLg.copyWith(
                            color: AppColors.primary,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Welcome Back',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.titleMd,
                        ),
                        const SizedBox(height: AppSpacing.unit),
                        Text(
                          'Sign in to book your next cinematic experience.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodySm,
                        ),
                        const SizedBox(height: AppSpacing.lg * 1.5),

                        // Email Input
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 8),
                          child: Text('Email', style: AppTextStyles.labelCaps),
                        ),
                        TextFormField(
                          controller: _emailController,
                          style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                          keyboardType: TextInputType.emailAddress,
                          decoration: _glassInputDecoration(
                            hint: 'enter your email',
                            icon: Icons.mail_outline_rounded,
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Email cannot be empty' : null,
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // Password Input
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Password', style: AppTextStyles.labelCaps),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                          decoration: _glassInputDecoration(
                            hint: 'enter your password',
                            icon: Icons.lock_outline_rounded,
                          ).copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.onSurfaceVariant,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Password cannot be empty' : null,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: AppTextStyles.bodySm.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // Login Button
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 15,
                                spreadRadius: -5,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.onPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Login', style: AppTextStyles.titleMd),
                                const SizedBox(width: 8),
                                const Icon(Icons.login_rounded),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Divider
                        Row(
                          children: [
                            const Expanded(child: Divider(color: AppColors.borderSubtle)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('OR', style: AppTextStyles.labelCaps),
                            ),
                            const Expanded(child: Divider(color: AppColors.borderSubtle)),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Google Login (Static)
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.surfaceContainer,
                            side: const BorderSide(color: AppColors.borderSubtle),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppRadius.md),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.g_mobiledata_rounded, size: 28, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Continue with Google',
                                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Register Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppTextStyles.bodySm,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                );
                              },
                              child: Text(
                                'Register',
                                style: AppTextStyles.titleMd.copyWith(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _glassInputDecoration({required String hint, required IconData icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.bodyLg.copyWith(
        color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
      ),
      prefixIcon: Icon(icon, color: AppColors.onSurfaceVariant),
      filled: true,
      fillColor: AppColors.surfaceContainer,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.borderSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }
}