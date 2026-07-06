import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Model Schedule
class Schedule {
  final String birdName;
  final String time;
  
  Schedule({required this.birdName, required this.time});
}

// 2. Notifier: Menggunakan Notifier (bukan StateNotifier di versi baru)
class ScheduleNotifier extends Notifier<List<Schedule>> {
  @override
  List<Schedule> build() {
    return []; // State awal kosong
  }

  void addSchedule(String bird, String time) {
    state = [...state, Schedule(birdName: bird, time: time)];
  }
}

// 3. Provider: Menggunakan NotifierProvider
final scheduleProvider = NotifierProvider<ScheduleNotifier, List<Schedule>>(() {
  return ScheduleNotifier();
});