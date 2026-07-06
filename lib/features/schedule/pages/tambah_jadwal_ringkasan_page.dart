import 'package:flutter/material.dart';

class TambahJadwalRingkasanPage extends StatelessWidget {
  const TambahJadwalRingkasanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ringkasan Jadwal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  _buildRow('Jenis Burung', 'Kacer'),
                  _buildRow('Playlist', '2 Audio'),
                  _buildRow('Waktu Mulai', '05:30'),
                  _buildRow('Durasi', '30 Menit'),
                  _buildRow('Volume', '30% → 80%'),
                  _buildRow('Hari', 'Setiap hari'),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity, height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386A3E)),
                onPressed: () {
                  // Kembali ke Home setelah simpan
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Simpan Jadwal', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label), Text(value, style: const TextStyle(fontWeight: FontWeight.bold))]),
  );
}