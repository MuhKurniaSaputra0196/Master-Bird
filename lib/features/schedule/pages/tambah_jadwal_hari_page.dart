import 'package:flutter/material.dart';
import 'tambah_jadwal_ringkasan_page.dart';

class TambahJadwalHariPage extends StatefulWidget {
  const TambahJadwalHariPage({Key? key}) : super(key: key);

  @override
  State<TambahJadwalHariPage> createState() => _TambahJadwalHariPageState();
}

class _TambahJadwalHariPageState extends State<TambahJadwalHariPage> {
  int _dayOption = 0; // 0: Setiap hari, 1: Hari kerja, 2: Weekend, 3: Custom
  List<bool> _selectedDays = List.filled(7, false);
  final List<String> _dayNames = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];

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
            const Text('Pilih Hari', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            RadioListTile(title: const Text('Setiap hari'), value: 0, groupValue: _dayOption, onChanged: (v) => setState(() => _dayOption = v!)),
            RadioListTile(title: const Text('Hari kerja (Senin - Jumat)'), value: 1, groupValue: _dayOption, onChanged: (v) => setState(() => _dayOption = v!)),
            RadioListTile(title: const Text('Akhir pekan (Sabtu - Minggu)'), value: 2, groupValue: _dayOption, onChanged: (v) => setState(() => _dayOption = v!)),
            RadioListTile(title: const Text('Pilih hari tertentu'), value: 3, groupValue: _dayOption, onChanged: (v) => setState(() => _dayOption = v!)),
            
            if (_dayOption == 3)
              Wrap(
                spacing: 8,
                children: List.generate(7, (index) => ChoiceChip(
                  label: Text(_dayNames[index]),
                  selected: _selectedDays[index],
                  selectedColor: const Color(0xFF386A3E),
                  labelStyle: TextStyle(color: _selectedDays[index] ? Colors.white : Colors.black),
                  onSelected: (bool selected) => setState(() => _selectedDays[index] = selected),
                )),
              ),
            
            const Spacer(),
            SizedBox(
              width: double.infinity, height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386A3E)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TambahJadwalRingkasanPage())),
                child: const Text('Selanjutnya', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}