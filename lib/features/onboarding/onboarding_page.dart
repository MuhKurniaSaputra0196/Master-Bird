import 'package:flutter/material.dart';
// Pastikan import ini mengarah ke MainScreen yang baru kita buat
import '../main_screen.dart'; 

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand, // Memastikan Stack memenuhi layar
        children: [
          // 1. Layer paling bawah: Background Image
          Image.asset(
            'Assets/images/onboarding_bird.png',
            fit: BoxFit.cover, // Membuat gambar penuh satu layar
          ),
          
          // 2. Layer tengah: Gradient putih transparan agar teks tetap terbaca
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.9), // Putih solid di area teks atas
                  Colors.white.withOpacity(0.0), // Transparan di tengah agar burung terlihat
                  Colors.white.withOpacity(0.6), // Sedikit putih di area tombol
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // 3. Layer paling atas: Konten teks dan tombol
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Masteran Otomatis\nSesuai Jadwal',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A23),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Atur jadwal masteran burungmu\ndengan mudah. Otomatis, tepat waktu,\ndan praktis.',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  
                  const Spacer(), // Mendorong elemen di bawahnya ke dasar layar
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(isActive: true),
                      const SizedBox(width: 6),
                      _buildDot(isActive: false),
                      const SizedBox(width: 6),
                      _buildDot(isActive: false),
                      const SizedBox(width: 6),
                      _buildDot(isActive: false),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Menggunakan pushReplacement untuk menghapus riwayat Onboarding
                        // dan mengarahkan pengguna ke MainScreen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A7253),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Mulai Sekarang',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget bantuan untuk membuat titik indikator
  Widget _buildDot({required bool isActive}) {
    return Container(
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4A7253) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}