import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const HeimdallApp());
}

class HeimdallApp extends StatelessWidget {
  const HeimdallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HEIMDALL',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const LoginScreen(),
    );
  }
}