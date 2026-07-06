import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Library',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          // 1. Kategori Burung (Scroll Horizontal)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Row(
              children: [
                _buildCategoryChip('Semua', isActive: true),
                _buildCategoryChip('Kacer', isActive: false),
                _buildCategoryChip('Murai Batu', isActive: false),
                _buildCategoryChip('Pleci', isActive: false),
                _buildCategoryChip('Kenari', isActive: false),
              ],
            ),
          ),

          // 2. Kolom Pencarian (Search Bar)
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari audio masteran...',
                hintStyle: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  color: Colors.grey,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.filter_list, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFF386A3E)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),

          // 3. Daftar Audio
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                _buildAudioItem(
                  title: 'Kacer Full Isian.mp3',
                  subtitle: '08:45',
                  imagePath: 'Assets/images/kacer.png', 
                ),
                _buildAudioItem(
                  title: 'Kacer Ngeplong.mp3',
                  subtitle: 'Kacer',
                  imagePath: 'Assets/images/kacer.png',
                ),
                _buildAudioItem(
                  title: 'Pleci Dakun Ngeroll.mp3',
                  subtitle: 'Pleci',
                  imagePath: 'Assets/images/onboarding_bird.png', // Pakai gambar pleci yang ada
                ),
                _buildAudioItem(
                  title: 'Murai Batu Medan.mp3',
                  subtitle: 'Murai Batu',
                  imagePath: 'Assets/images/murai.png',
                ),
                _buildAudioItem(
                  title: 'Kenari Gacor Panjang.mp3',
                  subtitle: 'Kenari',
                  imagePath: 'Assets/images/kenari.png',
                ),
                _buildAudioItem(
                  title: 'Cucak Hijau Full Tembakan.mp3',
                  subtitle: 'Cucak Hijau',
                  imagePath: 'Assets/images/cucak.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Bantuan untuk Kategori (Chips)
  Widget _buildCategoryChip(String label, {required bool isActive}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF386A3E) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
          color: isActive ? Colors.white : Colors.grey.shade600,
        ),
      ),
    );
  }

  // Widget Bantuan untuk Item Daftar Audio
  Widget _buildAudioItem({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          // Gambar / Icon Burung
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback jika gambar belum ada di folder Assets
                  return const Icon(
                    Icons.music_note,
                    color: Colors.grey,
                    size: 28,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Teks Judul dan Subjudul
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Terpotong rapi jika teks kepanjangan
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          // Tombol Play
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}