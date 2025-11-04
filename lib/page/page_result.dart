import 'package:flutter/material.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/page/page_home.dart';
import 'package:quizapp/page/page_quiz.dart';

class PageResult extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final ModelCategory category;
  final String userName; 

  const PageResult({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.category,
    required this.userName}); 

  @override
  State<PageResult> createState() => _PageResultState();
}

class _PageResultState extends State<PageResult> with TickerProviderStateMixin {
  
  final Color primaryBackground = const Color(0xFF1E2749); 
  
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
      return Colors.green.shade600;
    } else if (percentage >= 60) {
      return Colors.blueAccent.shade400;
    } else if (percentage >= 40) {
      return Colors.orange.shade700;
    } else {
      return Colors.redAccent.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      body: Center(
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
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 80,
                      color: resultColor,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      resultMessage,
                      style: const TextStyle(
                        fontSize: 32, // Lebih besar
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Skor ${widget.userName}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600, 
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.score}',
                            style: TextStyle(
                              fontSize: 64, // Paling besar
                              fontWeight: FontWeight.w900,
                              color: resultColor,
                            ),
                          ),
                          TextSpan(
                            text: '/${widget.totalQuestions}',
                            style: TextStyle(
                              fontSize: 32, 
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: resultColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => PageQuiz(
                            category: widget.category,
                            userName: widget.userName) 
                        ));
                      },
                      child: const Text(
                        'Coba Lagi!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PageHome(userName: widget.userName)));
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white38, width: 2), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ) 
                      ), 
                      child: const Text(
                        'Kembali',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
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
    );
  }
}