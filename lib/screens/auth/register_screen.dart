import 'package:flutter/material.dart';
import 'dart:ui';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _handleRegister() {
    // Trigger Validation
    if (_formKey.currentState!.validate()) {
      // If Valid > Login
      print("Registration successful! Returning to Login...");
      Navigator.pop(context);
    }
  }

  void _goToLogin() {
    Navigator.pop(context);
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
      backgroundColor: const Color(0xFF131314), // Background
      body: Stack(
        children: [
          // BG Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=1000&auto=format&fit=crop',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x66131314),
                    Color(0xFF131314),
                  ],
                ),
              ),
            ),
          ),

          // Register Form
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    const Text(
                      "CineGo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 64,
                        color: Color(0xFFE50914),
                        letterSpacing: 3.0,
                        shadows: [
                          Shadow(
                            color: Color(0x66E50914),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Join the Experience",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE9BCB6),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Container
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                        child: Container(
                          padding: const EdgeInsets.all(32.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F1F23).withOpacity(0.4), // glass-panel
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(
                              top: BorderSide(color: Colors.white10),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Full Name
                                _buildInputField(
                                  label: "Full Name",
                                  controller: _nameController,
                                  icon: Icons.person_outline,
                                  hintText: "John Doe",
                                  validator: (value) => value == null || value.isEmpty ? 'Name cannot be empty' : null,
                                ),
                                const SizedBox(height: 16),

                                // Email
                                _buildInputField(
                                  label: "Email",
                                  controller: _emailController,
                                  icon: Icons.mail_outline,
                                  hintText: "name@example.com",
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => value == null || value.isEmpty ? 'Email cannot be empty' : null,
                                ),
                                const SizedBox(height: 16),

                                // Password
                                _buildPasswordField(
                                  label: "PASSWORD",
                                  controller: _passwordController,
                                  hintText: "••••••••",
                                  isObscure: _obscurePassword,
                                  onToggleVisibility: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  validator: (value) => value == null || value.isEmpty ? 'Password cannot be empty' : null,
                                ),
                                const SizedBox(height: 16),

                                // Confirm Password
                                _buildPasswordField(
                                  label: "Confirm Password",
                                  controller: _confirmPasswordController,
                                  hintText: "••••••••",
                                  isObscure: _obscureConfirmPassword,
                                  onToggleVisibility: () {
                                    setState(() {
                                      _obscureConfirmPassword = !_obscureConfirmPassword;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (value != _passwordController.text) {
                                      return 'Passwords did not match';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 32),

                                // Button Register
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFFE50914).withOpacity(0.5),
                                        blurRadius: 15,
                                        spreadRadius: -2,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: _handleRegister,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE50914),
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Register",
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Link back to Login if already have an Account
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFFE9BCB6),
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: _goToLogin,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xFFE50914),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for Form
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12, // label-caps
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Color(0xFFE9BCB6),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter'
            ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFFE9BCB6).withOpacity(0.5)
              ),
            filled: true,
            fillColor: const Color(0xFF353436).withOpacity(0.5), // surface-container-highest
            prefixIcon: Icon(
              icon,
              color: const Color(0xFFE9BCB6)
              ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white10
                )
              ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white10
                )
              ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE50914)
                )
              ),
            errorStyle: const TextStyle(
              color: Color(0xFFFFB4AB)
              ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  // Helper widget for Password Field
  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required bool isObscure,
    required VoidCallback onToggleVisibility,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Color(0xFFE9BCB6),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: const Color(0xFFE9BCB6).withOpacity(0.5)),
            filled: true,
            fillColor: const Color(0xFF353436).withOpacity(0.5),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xFFE9BCB6)
              ),
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFFE9BCB6),
              ),
              onPressed: onToggleVisibility,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white10
                )
              ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white10
                )
              ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE50914)
                )
              ),
            errorStyle: const TextStyle(color: Color(0xFFFFB4AB)),
          ),
          validator: validator,
        ),
      ],
    );
  }
}