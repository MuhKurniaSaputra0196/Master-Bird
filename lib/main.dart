import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/home/pages/home_page.dart';

void main() {
  runApp(const MasterBirdApp());
}

class MasterBirdApp extends StatelessWidget {
  const MasterBirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MasterBird',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}