import 'package:flutter/material.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/page/page_home.dart';
import 'package:quizapp/page/page_quiz.dart';

class PageResult extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final ModelCategory category;
  final String userName; // Tambahkan properti userName

  const PageResult({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.category,
    required this.userName}); // Wajib ada di constructor

  @override
  State<PageResult> createState() => _PageResultState();
}

class _PageResultState extends State<PageResult> with TickerProviderStateMixin {
  
  String get resultMessage {
    double percentage = (widget.score / widget.totalQuestions) * 100;
    if (percentage >= 80) {
      return 'Luar Biasa!';
    } else if (percentage >= 60) {
      return 'Kerja bagus!';
    } else if (percentage >= 40) {
      return 'Tidak Buruk!';
    } else {
      return 'Coba Lagi!';
    }
  }

  Color get resultColor {
    double percentage = (widget.score / widget.totalQuestions) * 100;
    if (percentage >= 80) {
      return Colors.green;
    } else if (percentage >= 60) {
      return Colors.blueAccent;
    } else if (percentage >= 40) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              resultColor.withOpacity(0.8),
              resultColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ), 
        ), 
        child: Center(
          child: Padding( 
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Kartu Hasil (Ikon, Pesan, dan Skor)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 8)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emoji_events_outlined,
                        size: 80,
                        color: Colors.amber,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        resultMessage,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Tambahkan nama pengguna di sini jika perlu, contoh:
                      /*
                      Text(
                        'Skor ${widget.userName}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[300],
                        ),
                      ),
                      */
                      Text(
                        'Skor Kamu',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[300],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.score}',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: resultColor,
                              ),
                            ),
                            TextSpan(
                              text: '/${widget.totalQuestions}',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[300],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),

                // 2. Tombol Aksi
                Column(
                  children: [
                    // Tombol Coba Lagi! (Mengulang Kuis)
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 8,
                        ),
                        onPressed: () {
                          // Navigasi ke PageQuiz, meneruskan userName
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => PageQuiz(
                              category: widget.category,
                              userName: widget.userName) // Meneruskan userName
                          ));
                        },
                        child: const Text(
                          'Coba Lagi!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Tombol Kembali ke Home
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigasi ke PageHome, meneruskan userName
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PageHome(userName: widget.userName)));
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                          ) 
                        ), 
                        child: const Text(
                          'Kembali',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}