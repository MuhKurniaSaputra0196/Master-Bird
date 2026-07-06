import 'package:flutter/material.dart';

class ScheduleDetailPage extends StatelessWidget {
  const ScheduleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Latar belakang abu-abu sangat muda
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Jadwal',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bagian Waktu, Judul, dan Status
            const Text(
              '05:30',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A23), // Warna hijau gelap khas MasterBird
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pagi - Kacer',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Hijau sangat muda
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Aktif',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  color: Color(0xFF386A3E),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Card Berisi Daftar Detail
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  _buildDetailRow(Icons.pets, 'Jenis Burung', 'Kacer'),
                  const Divider(height: 32, color: Color(0xFFEEEEEE)),
                  _buildDetailRow(Icons.queue_music, 'Playlist', '3 Audio'),
                  const Divider(height: 32, color: Color(0xFFEEEEEE)),
                  _buildDetailRow(Icons.timer_outlined, 'Durasi', '30 Menit'),
                  const Divider(height: 32, color: Color(0xFFEEEEEE)),
                  _buildDetailRow(Icons.volume_up_outlined, 'Volume Awal', '30% → 80%'),
                  const Divider(height: 32, color: Color(0xFFEEEEEE)),
                  _buildDetailRow(Icons.calendar_today_outlined, 'Hari', 'Setiap hari'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Edit Jadwal
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, size: 20),
                label: const Text('Edit Jadwal'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF386A3E),
                  side: const BorderSide(color: Color(0xFF386A3E)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // Tombol Uji Coba
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow_outlined, size: 20),
                label: const Text('Uji Coba Sekarang'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF386A3E),
                  side: const BorderSide(color: Color(0xFF386A3E)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Tombol Hapus (Text Button)
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              label: const Text(
                'Hapus Jadwal',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Widget Bantuan untuk menyusun tiap baris detail di dalam Card
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}