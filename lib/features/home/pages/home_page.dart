import 'package:flutter/material.dart';
import 'package:masterbird/core/theme/app_colors.dart';
import 'package:masterbird/features/home/widgets/home_header.dart';
import 'package:masterbird/features/home/widgets/schedule_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [

          const HomeHeader(),

          Positioned(
            top: 180,
            left: 20,
            right: 20,
            child: Column(
              children: [

                const ScheduleCard(),

              ],
            ),
          )

        ],
      ),
    );
  }
}