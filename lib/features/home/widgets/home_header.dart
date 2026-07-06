import 'package:flutter/material.dart';
import 'package:masterbird/core/theme/app_colors.dart';
import 'package:masterbird/core/theme/app_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/home_header.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.20),
              Colors.black.withValues(alpha: 0.45),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                _circleButton(Icons.menu),

                const Spacer(),

                _circleButton(Icons.notifications_none),
              ],
            ),

            const Spacer(),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selamat pagi, Putra 👋",
                style: AppText.title.copyWith(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Semoga burung kesayanganmu\nsehat dan gacor setiap hari.",
                style: AppText.body.copyWith(
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.20),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}