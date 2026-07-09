import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      // Logic for successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful!')),
      );
      // Navigate back to Login
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  AppColors.background.withValues(alpha: 0.0),
                  AppColors.background,
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDTrb3ElA0AnTT0lGGYofGpJFgbFyeCunNRLaMO9w9SyaG6atL7Z4Lp4MN_1LNcE8V-Ma6TFVJbvNVvZEs3yTw_9Ak6QcC4OhRPGvdXRkq15xrlxUp7B6r85s_abnnZWuFl2Kt4oX7evO_h8ahJjyAB7vJg-B21jHuJpkYwViNBA4sOeCaE901nUVMhb_C1KzBdA4hfoXsiwwcM0xrqvI3kh5gzPlAMWycTQyNiZVyymnJt2jaOqPBg2JlHLwC9n6_wJkQi6gGFYw',
                fit: BoxFit.cover,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Header
                      Text(
                        'CineGo',
                        style: AppTextStyles.displayLg.copyWith(
                          color: AppColors.primary,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              color: AppColors.primary.withValues(alpha: 0.4),
                              blurRadius: 15,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text('Join the Experience', style: AppTextStyles.titleMd),
                      const SizedBox(height: AppSpacing.lg),

                      // Registration Form Card (Glass Panel)
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                          border: Border(
                            top: BorderSide(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Full Name Input
                              Text('Full Name', style: AppTextStyles.labelCaps),
                              const SizedBox(height: AppSpacing.unit),
                              TextFormField(
                                controller: _nameController,
                                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                decoration: _glowInputDecoration(
                                  hint: 'John Doe',
                                  icon: Icons.person_outline_rounded,
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty ? 'Name required' : null,
                              ),
                              const SizedBox(height: AppSpacing.md),

                              // Email Input
                              Text('Email', style: AppTextStyles.labelCaps),
                              const SizedBox(height: AppSpacing.unit),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                decoration: _glowInputDecoration(
                                  hint: 'name@example.com',
                                  icon: Icons.mail_outline_rounded,
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty ? 'Email required' : null,
                              ),
                              const SizedBox(height: AppSpacing.md),

                              // Password Input
                              Text('Password', style: AppTextStyles.labelCaps),
                              const SizedBox(height: AppSpacing.unit),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                decoration: _glowInputDecoration(
                                  hint: '••••••••',
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
                                    value == null || value.isEmpty ? 'Password required' : null,
                              ),
                              const SizedBox(height: AppSpacing.md),

                              // Confirm Password Input
                              Text('Confirm Password', style: AppTextStyles.labelCaps),
                              const SizedBox(height: AppSpacing.unit),
                              TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: _obscurePassword,
                                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                decoration: _glowInputDecoration(
                                  hint: '••••••••',
                                  icon: Icons.lock_outline_rounded,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppSpacing.lg),

                              // Register Button
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
                                  onPressed: _handleRegister,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.onPrimary,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppRadius.sm),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Register', style: AppTextStyles.titleMd),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward_rounded),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyles.bodySm,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              'Login',
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
        ],
      ),
    );
  }

  InputDecoration _glowInputDecoration({required String hint, required IconData icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.bodyLg.copyWith(
        color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
      ),
      prefixIcon: Icon(icon, color: AppColors.onSurfaceVariant),
      filled: true,
      fillColor: AppColors.surfaceContainerHighest.withValues(alpha: 0.5),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 2),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 2),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }
}