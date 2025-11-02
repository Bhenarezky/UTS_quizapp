import 'package:flutter/material.dart';
import 'package:quizapp/page/page_home.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final TextEditingController _nameController = TextEditingController();
  // Warna Latar Belakang Baru
  final Color primaryBackground = const Color(0xFF1E2749); 

  void _navigateToHome() {
    final String userName = _nameController.text.trim();
    
    if (userName.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PageHome(userName: userName), 
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama tidak boleh kosong!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Kartu tetap putih untuk kontras tajam
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.school,
                      size: 80,
                      color: Color(0xFFFFD700), // Aksen Gold
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Selamat Datang di EduQuiz!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Masukkan nama Anda untuk memulai kuis.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4A5568),
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Color(0xFF2D3748)), // Teks input gelap
                      decoration: InputDecoration(
                        labelText: 'Nama Pengguna',
                        labelStyle: const TextStyle(color: Color(0xFF6C63FF)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFFFD700), width: 2),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF8F9FF),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _navigateToHome(),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _navigateToHome,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD700), // Tombol utama Aksen Gold
                          foregroundColor: const Color(0xFF2D3748), // Teks gelap
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Mulai Kuis',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}