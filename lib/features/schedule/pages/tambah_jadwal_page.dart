import 'package:flutter/material.dart';
import 'tambah_jadwal_audio_page.dart'; 

class TambahJadwalPage extends StatelessWidget {
  const TambahJadwalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tambah Jadwal',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepIndicator('1', isActive: true),
                _buildStepLine(),
                _buildStepIndicator('2', isActive: false),
                _buildStepLine(),
                _buildStepIndicator('3', isActive: false),
                _buildStepLine(),
                _buildStepIndicator('4', isActive: false),
                _buildStepLine(),
                _buildStepIndicator('5', isActive: false),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Pilih Jenis Burung',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          
          const SizedBox(height: 16),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
              children: [
                // Melempar nama dan path gambar ke fungsi _buildBirdCard
                _buildBirdCard(context, 'Kacer', 'Assets/images/kacer.jpg'),
                _buildBirdCard(context, 'Murai Batu', 'Assets/images/murai.jpg'),
                _buildBirdCard(context, 'Pleci', 'Assets/images/pleci.jpg'), // Pastikan file ini ada atau ganti dengan pleci.png
                _buildBirdCard(context, 'Kenari', 'Assets/images/kenari.jpg'),
                _buildBirdCard(context, 'Cucak Hijau', 'Assets/images/cucakhijau.jpg'),
                _buildBirdCard(context, 'Cendet', 'Assets/images/cendet.jpg'),
                _buildBirdCard(context, 'Lovebird', 'Assets/images/lovebird.jpg'),
                _buildOtherCard(), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(String step, {required bool isActive}) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF386A3E) : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? const Color(0xFF386A3E) : Colors.grey.shade300,
        ),
      ),
      child: Center(
        child: Text(
          step,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  Widget _buildStepLine() {
    return Container(
      width: 20,
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  // Parameter isActive dihapus agar semua card bersih berwarna putih
  Widget _buildBirdCard(BuildContext context, String name, String imagePath) {
    return InkWell(
      onTap: () {
        // Saat diklik, kita mengirim data birdName dan birdImage ke halaman Audio
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TambahJadwalAudioPage(
              birdName: name,
              birdImage: imagePath,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.pets,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.more_horiz, color: Colors.grey, size: 32),
            SizedBox(height: 8),
            Text(
              'Lainnya',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}