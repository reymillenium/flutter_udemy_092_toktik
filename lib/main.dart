import 'package:flutter/material.dart';
import 'package:flutter_udemy_092_toktik/config/theme/app_theme.dart';
import 'package:flutter_udemy_092_toktik/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const HomeScreen(title: 'Tok-Tik'),
    );
  }
}
