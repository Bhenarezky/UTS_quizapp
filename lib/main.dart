import 'package:flutter/material.dart';
import 'package:quizapp/page/page_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const PageLogin(), // Mengubah PageHome menjadi PageLogin
    );
  }
}