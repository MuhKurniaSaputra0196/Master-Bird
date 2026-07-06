import 'package:flutter/material.dart';
import 'home/pages/home_page.dart';
import 'library/pages/library_page.dart';
// Tambahkan import ini di bagian atas
import 'schedule/pages/tambah_jadwal_page.dart'; 

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('Player Page (Segera Hadir)')), 
    const LibraryPage(),
    const Center(child: Text('Profil Page (Segera Hadir)')), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      
      // Update di bagian ini!
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman Tambah Jadwal saat tombol + diklik
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahJadwalPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF386A3E),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomNavigationBar(
        // ... (kode BottomNavigationBar tetap sama seperti sebelumnya)
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped, 
        selectedItemColor: const Color(0xFF386A3E),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Player'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}