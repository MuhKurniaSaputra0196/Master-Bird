import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/schedule_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const HomeHeader(),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ListView(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 100),
                children: const [
                  Text(
                    'Jadwal Aktif',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  ScheduleCard(
                    time: '05:30',
                    title: 'Pagi - Kacer',
                    subtitleTime: '06:15',
                    day: 'Setiap hari',
                    isActive: true,
                  ),
                  ScheduleCard(
                    time: '12:00',
                    title: 'Istirahat Siang - Pleci',
                    subtitleTime: '06:45',
                    day: 'Senin - Jumat',
                    isActive: true,
                  ),
                  ScheduleCard(
                    time: '18:00',
                    title: 'Sore - Murai Batu',
                    subtitleTime: '06:49',
                    day: 'Setiap hari',
                    isActive: true,
                  ),
                  ScheduleCard(
                    time: '20:30',
                    title: 'Malam - Kenari',
                    subtitleTime: '06:33',
                    day: 'Sabtu - Minggu',
                    isActive: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // BottomNavigationBar dan FloatingActionButton sudah dihapus dari sini!
    );
  }
}