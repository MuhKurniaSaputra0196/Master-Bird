import 'package:flutter/material.dart';

class TambahJadwalWaktuPage extends StatefulWidget {
  const TambahJadwalWaktuPage({Key? key}) : super(key: key);

  @override
  State<TambahJadwalWaktuPage> createState() => _TambahJadwalWaktuPageState();
}

class _TambahJadwalWaktuPageState extends State<TambahJadwalWaktuPage> {
  // State untuk menyimpan waktu, default di 05:30
  TimeOfDay _selectedTime = const TimeOfDay(hour: 5, minute: 30);
  
  // State untuk nilai RangeSlider Volume
  RangeValues _volumeRange = const RangeValues(30, 80);
  String _selectedDuration = '30 Menit';

  // Fungsi untuk memunculkan dialog Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        // Kustomisasi warna TimePicker agar senada dengan tema MasterBird
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF386A3E), // Warna hijau utama
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );
    
    // Jika user memilih waktu baru, update state-nya
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
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
          // Indikator Langkah
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepIndicator('1', isPassed: true),
                _buildStepLine(),
                _buildStepIndicator('2', isPassed: true),
                _buildStepLine(),
                _buildStepIndicator('3', isPassed: true, isActive: true),
                _buildStepLine(),
                _buildStepIndicator('4', isPassed: false),
                _buildStepLine(),
                _buildStepIndicator('5', isPassed: false),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Atur Waktu',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          
          const SizedBox(height: 24),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                // Waktu Mulai
                const Text(
                  'Waktu Mulai',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Area Waktu yang bisa diklik
                GestureDetector(
                  onTap: () => _selectTime(context), // Panggil fungsi saat diklik
                  child: Row(
                    children: [
                      // .padLeft(2, '0') digunakan agar angka 5 menjadi "05"
                      _buildTimeBox(_selectedTime.hour.toString().padLeft(2, '0')),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          ':',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildTimeBox(_selectedTime.minute.toString().padLeft(2, '0')),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),

                // Durasi
                const Text(
                  'Durasi',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedDuration,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black87),
                      style: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      items: <String>['15 Menit', '30 Menit', '45 Menit', '60 Menit']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDuration = newValue!;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Volume Awal
                const Text(
                  'Volume Awal',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '${_volumeRange.start.round()}%',
                      style: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: const Color(0xFF386A3E),
                          inactiveTrackColor: Colors.grey.shade300,
                          thumbColor: const Color(0xFF386A3E),
                          trackHeight: 4,
                          rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 8),
                        ),
                        child: RangeSlider(
                          values: _volumeRange,
                          min: 0,
                          max: 100,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _volumeRange = values;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      '${_volumeRange.end.round()}%',
                      style: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
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
                // TODO: Lanjut ke step 4
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

  // Widget Bantuan: Kotak Input Waktu
  Widget _buildTimeBox(String time) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  // Widget Bantuan: Indikator Langkah
  Widget _buildStepIndicator(String step, {bool isActive = false, required bool isPassed}) {
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