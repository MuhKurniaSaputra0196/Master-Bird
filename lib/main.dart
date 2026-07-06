import 'package:flutter/material.dart';
// Pastikan path import ini sesuai dengan struktur folder kamu
import 'features/onboarding/splash_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterBird',
      debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG" di pojok kanan atas
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: Colors.white,
      ),
      // Di sinilah kuncinya, atur SplashPage sebagai halaman pertama
      home: const SplashPage(), 
    );
  }
}