import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF1E3A23), // Warna background cadangan (Hijau Gelap)
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image dengan error handler
          Image.asset(
            'Assets/images/splash_bg.png', 
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Jika gambar tidak ditemukan, kembalikan Container kosong
              // sehingga background color dari Scaffold yang akan terlihat
              return const SizedBox.shrink(); 
            },
          ),
          
          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          
          // Konten Tengah
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
                          
            ],
          ),
        ],
      ),
    );
  }
}