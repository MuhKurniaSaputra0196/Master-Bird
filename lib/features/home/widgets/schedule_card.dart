import 'package:flutter/material.dart';
// Pastikan path import ini sesuai dengan lokasi file ScheduleDetailPage kamu
import '../../schedule/pages/schedule_detail_page.dart';

class ScheduleCard extends StatelessWidget {
  final String time;
  final String title;
  final String subtitleTime;
  final String day;
  final bool isActive;

  const ScheduleCard({
    Key? key,
    required this.time,
    required this.title,
    required this.subtitleTime,
    required this.day,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman Detail Jadwal saat card diklik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ScheduleDetailPage(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16), // Efek klik mengikuti bentuk card
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.play_circle_fill, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        subtitleTime,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.calendar_today, size: 14, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        day,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bungkus Switch dengan GestureDetector agar ketika switch diklik, 
            // tidak memicu onTap milik InkWell (hanya switchnya saja yang berubah)
            GestureDetector(
              onTap: () {}, // Mencegah klik tembus ke bawah
              child: Switch(
                value: isActive,
                onChanged: (val) {
                  // TODO: Tambahkan logic ubah status jadwal di sini nanti
                },
                activeColor: const Color(0xFF386A3E),
                inactiveTrackColor: Colors.grey.shade300,
              ),
            )
          ],
        ),
      ),
    );
  }
}