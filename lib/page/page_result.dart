import 'package:flutter/material.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/page/page_home.dart';
import 'package:quizapp/page/page_quiz.dart';

class PageResult extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final ModelCategory category;

  const PageResult({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.category});

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
          ), // LinearGradient
        ), // BoxDecoration
        child: Center(
          child: Padding( 
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      ) // BoxShadow
                    ]
                  ), // BoxDecoration
                  child: Column(
                    children: [
                      // Ikon Piala
                      const Icon(
                        Icons.emoji_events_outlined,
                        size: 80,
                        color: Colors.amber,
                      ), // Icon
                      const SizedBox(height: 24),
                      // Pesan Hasil (Luar Biasa! / Coba Lagi!)
                      Text(
                        resultMessage,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ), // TextStyle
                      ), // Text
                      const SizedBox(height: 24),
                      // Label Skor
                      Text(
                        'Skor Kamu',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[300],
                        ), // TextStyle
                      ), // Text
                      const SizedBox(height: 8),
                      // Angka Skor Utama
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.score}',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: resultColor,
                              ), // TextStyle
                            ), // TextSpan
                            TextSpan(
                              text: '/${widget.totalQuestions}',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[300],
                              ), // TextStyle
                            ) // TextSpan
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
                    // Tombol Coba Lagi!
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ), // RoundedRectangleBorder
                          elevation: 8,
                        ), // ElevatedButton.styleFrom
                        onPressed: () {
                          // Mulai kuis lagi (pushReplacement)
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => PageQuiz(
                              category: widget.category) // PageQuiz
                          )); // MaterialPageRoute
                        },
                        child: const Text(
                          'Coba Lagi!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF2D3748),
                          ), // TextStyle
                        ), // Text
                      ), // ElevatedButton
                    ), // SizedBox
                    
                    const SizedBox(height: 16),
                    
                    // Tombol Kembali ke Home
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          // Kembali ke halaman utama (push)
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PageHome()));
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