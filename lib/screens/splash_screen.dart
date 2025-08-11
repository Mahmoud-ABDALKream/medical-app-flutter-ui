import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

/// Splash screen widget that displays the app logo and branding
/// Matches the blue branded screen from the design
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF4285F4), // Primary blue color
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08, // 8% of screen width
            vertical: screenHeight * 0.05,  // 5% of screen height
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo container with medical icon
              Container(
                width: screenWidth * 0.25, // 25% of screen width
                height: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.local_hospital,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              
              SizedBox(height: screenHeight * 0.03), // 3% spacing
              
              // App name text
              const Text(
                'Medica',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              
              SizedBox(height: screenHeight * 0.15), // Large spacing
              
              // Get started button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFF4285F4),
                ),
              ),
              
              SizedBox(height: screenHeight * 0.02),
              
              // Skip button
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
