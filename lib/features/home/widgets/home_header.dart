import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // Memanggil gambar dari folder Assets sesuai strukturmu
          image: AssetImage('Assets/images/home_header.jpg'), 
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_active, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Selamat pagi, Putra 👋',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Semoga burung kesayanganmu\nsehat dan gacor setiap hari.',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}