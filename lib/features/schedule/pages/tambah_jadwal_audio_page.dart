import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Import package file picker
import 'tambah_jadwal_waktu_page.dart';

class TambahJadwalAudioPage extends StatefulWidget {
  final String birdName;
  final String birdImage;

  const TambahJadwalAudioPage({
    Key? key,
    required this.birdName,
    required this.birdImage,
  }) : super(key: key);

  @override
  State<TambahJadwalAudioPage> createState() => _TambahJadwalAudioPageState();
}

class _TambahJadwalAudioPageState extends State<TambahJadwalAudioPage> {
  // Menyimpan daftar audio secara dinamis (sementara menggunakan List, nanti diganti Database)
  List<Map<String, String>> _audioList = [];
  List<bool> _selectedAudios = [];

  @override
  void initState() {
    super.initState();
    _loadDefaultAudios();
  }

  // Fungsi untuk memuat daftar audio bawaan sesuai nama burung
  void _loadDefaultAudios() {
    String bird = widget.birdName.toLowerCase();
    
    if (bird.contains('kacer')) {
      _audioList = [
        {'title': 'Kacer Full Isian.mp3', 'path': 'Assets/audio/kacerfullisian.mp3', 'duration': '08:45'},
        {'title': 'Kacer Ngeplong.mp3', 'path': 'Assets/audio/kacerngeplong.mp3', 'duration': '05:30'},
      ];
    } else if (bird.contains('cendet')) {
      _audioList = [{'title': 'Cendet Full Isian.mp3', 'path': 'Assets/audio/cendetfullisian.mp3', 'duration': '04:20'}];
    } else if (bird.contains('cucak')) {
      _audioList = [{'title': 'Cucak Hijau Full Isian.mp3', 'path': 'Assets/audio/cucakhijaufullisian.mp3', 'duration': '06:15'}];
    } else if (bird.contains('kenari')) {
      _audioList = [{'title': 'Kenari Full Isian.mp3', 'path': 'Assets/audio/kenarifullisian.mp3', 'duration': '07:10'}];
    } else if (bird.contains('lovebird')) {
      _audioList = [{'title': 'Lovebird Full Isian.mp3', 'path': 'Assets/audio/lovebirdfullisian.mp3', 'duration': '03:45'}];
    } else if (bird.contains('pleci')) {
      _audioList = [{'title': 'Pleci Full Isian.mp3', 'path': 'Assets/audio/plecifullisian.mp3', 'duration': '05:00'}];
    } else {
      // Default jika tidak ada file bawaan (misal Murai Batu belum ada di folder)
      _audioList = []; 
    }

    // Mengisi status checkbox (default audio pertama di-ceklis)
    _selectedAudios = List<bool>.filled(_audioList.length, false);
    if (_selectedAudios.isNotEmpty) {
      _selectedAudios[0] = true;
    }
  }

  // Fungsi untuk membuka File Manager dan menambahkan audio sendiri
  Future<void> _pickCustomAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio, // Membatasi agar pengguna hanya bisa memilih file audio
    );

    if (result != null) {
      // Jika pengguna memilih file, tambahkan ke dalam list
      setState(() {
        _audioList.add({
          'title': result.files.single.name,
          'path': result.files.single.path ?? '',
          'duration': '--:--', // Karena butuh package audio player untuk membaca durasi asli
        });
        // Audio yang baru ditambahkan akan langsung ter-ceklis
        _selectedAudios.add(true); 
      });
    }
  }

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepIndicator('1', isActive: false, isPassed: true),
                _buildStepLine(),
                _buildStepIndicator('2', isActive: true, isPassed: false),
                _buildStepLine(),
                _buildStepIndicator('3', isActive: false, isPassed: false),
                _buildStepLine(),
                _buildStepIndicator('4', isActive: false, isPassed: false),
                _buildStepLine(),
                _buildStepIndicator('5', isActive: false, isPassed: false),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Pilih Audio / Playlist',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F2), 
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.birdImage,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.pets, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.birdName,
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _audioList.length + 1, // +1 untuk menaruh tombol di paling bawah
              separatorBuilder: (context, index) {
                if (index < _audioList.length) {
                  return const Divider(color: Color(0xFFEEEEEE), height: 1);
                }
                return const SizedBox.shrink();
              },
              itemBuilder: (context, index) {
                // Merender List Audio
                if (index < _audioList.length) {
                  return _buildAudioItem(
                    index,
                    _audioList[index]['title']!,
                    _audioList[index]['duration']!,
                  );
                }
                
                // Merender tombol "Tambah Audio Lain" di indeks paling akhir
                return Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: OutlinedButton.icon(
                    onPressed: _pickCustomAudio, // Memanggil fungsi FilePicker
                    icon: const Icon(Icons.add, size: 20),
                    label: const Text('Tambah Audio Lain'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF386A3E),
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TambahJadwalWaktuPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF386A3E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Selanjutnya',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAudioItem(int index, String title, String duration) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        duration,
        style: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            _selectedAudios[index] = !_selectedAudios[index];
          });
        },
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _selectedAudios[index] ? const Color(0xFF386A3E) : Colors.transparent,
            border: Border.all(
              color: _selectedAudios[index] ? const Color(0xFF386A3E) : Colors.grey.shade400,
              width: 1.5,
            ),
          ),
          child: _selectedAudios[index]
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
      ),
    );
  }

  Widget _buildStepIndicator(String step, {required bool isActive, required bool isPassed}) {
    Color bgColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.grey.shade400;

    if (isActive || isPassed) {
      bgColor = const Color(0xFF386A3E);
      borderColor = const Color(0xFF386A3E);
      textColor = Colors.white;
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text(
          step,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }

  Widget _buildStepLine() {
    return Container(width: 20, height: 1, color: Colors.grey.shade300);
  }
}