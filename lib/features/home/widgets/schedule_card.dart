import 'package:flutter/material.dart';
import 'package:masterbird/core/theme/app_colors.dart';
import 'package:masterbird/core/theme/app_text.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Row(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "05:30",
                style: AppText.title.copyWith(
                  fontSize: 26,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "Pagi • Kacer",
                style: AppText.caption,
              ),

              Text(
                "Setiap hari",
                style: AppText.caption.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const Spacer(),

          Switch(
            value: true,
            onChanged: (v) {},
          )

        ],
      ),
    );
  }
}