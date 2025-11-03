import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/model/model_question.dart';
import 'package:quizapp/page/page_home.dart';
import 'package:quizapp/page/page_result.dart';

import '../widget/answer_card.dart';

class PageQuiz extends StatefulWidget {
  final ModelCategory category;
  final String userName; 

  const PageQuiz({super.key, required this.category, required this.userName});

  @override
  State<PageQuiz> createState() => _PageQuizState();
}

class _PageQuizState extends State<PageQuiz> with TickerProviderStateMixin {
  int currentQuestionIndex = 0;
  int yourScore = 0;
  int? selectedAnswer;
  bool isAnswered = false;

  final Color primaryBackground = const Color(0xFF1E2749); 
  final Color surfaceColor = const Color(0xFF27335C); 

  // Data Soal Dinamis Berdasarkan Kategori
  static final Map<String, List<ModelQuestion>> _questionMap = {
    'Umum': [
      ModelQuestion(strText: 'Siapakah presiden pertama Indonesia?', strListOptions: ['Soekarno', 'Soeharto', 'Jokowi', 'B.J. Habibie'], strCorrectAnswer: 0),
      ModelQuestion(strText: 'Apa ibukota negara Jepang?', strListOptions: ['Seoul', 'Beijing', 'Tokyo', 'Bangkok'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Tahun berapa Indonesia merdeka?', strListOptions: ['1940', '1945', '1950', '1998'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Hewan apa yang bisa mengubah warna kulitnya?', strListOptions: ['Kucing', 'Bunglon', 'Gajah', 'Singa'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Satuan internasional untuk daya listrik adalah?', strListOptions: ['Volt', 'Ampere', 'Ohm', 'Watt'], strCorrectAnswer: 3),
    ],
    'Sains': [
      ModelQuestion(strText: 'Bahan bakar utama yang digunakan matahari adalah?', strListOptions: ['Oksigen', 'Karbon', 'Hidrogen', 'Nitrogen'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Berapa derajat titik didih air pada tekanan atmosfer normal?', strListOptions: ['0°C', '50°C', '100°C', '212°C'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Proses fotosintesis menghasilkan?', strListOptions: ['Karbon dioksida', 'Air', 'Oksigen', 'Nitrogen'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Planet terdekat dari matahari adalah?', strListOptions: ['Mars', 'Bumi', 'Venus', 'Merkurius'], strCorrectAnswer: 3),
      ModelQuestion(strText: 'Apa nama tulang terpanjang di tubuh manusia?', strListOptions: ['Tulang kering', 'Tulang lengan atas', 'Tulang paha', 'Tulang belakang'], strCorrectAnswer: 2),
    ],
    'Matematika': [
      ModelQuestion(strText: 'Hasil dari 5 x (4 + 2) adalah?', strListOptions: ['20', '22', '30', '40'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Jika x + 7 = 15, maka nilai x adalah?', strListOptions: ['6', '8', '22', '105'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Berapa persentase dari 1/4?', strListOptions: ['10%', '25%', '40%', '50%'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Luas persegi dengan sisi 8 cm adalah?', strListOptions: ['16 cm²', '32 cm²', '64 cm²', '80 cm²'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Angka prima setelah 10 adalah?', strListOptions: ['11', '12', '14', '15'], strCorrectAnswer: 0),
    ],
    'Bahasa Inggris': [
      ModelQuestion(strText: 'Apa bentuk lampau (past tense) dari kata "Eat"?', strListOptions: ['Eaten', 'Ate', 'Eating', 'Eated'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Lawan kata dari "Fast" adalah?', strListOptions: ['Quick', 'Speedy', 'Slow', 'Rapid'], strCorrectAnswer: 2),
      ModelQuestion(strText: 'Terjemahan yang benar untuk "Saya sedang belajar" adalah?', strListOptions: ['I studied', 'I am studying', 'I study', 'I will study'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Which word is a synonym for \'Huge\'?', strListOptions: ['Tiny', 'Large', 'Small', 'Narrow'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Kata apa yang merupakan kata benda (noun)?', strListOptions: ['Run', 'Quickly', 'Table', 'Happy'], strCorrectAnswer: 2),
    ],
    'Sejarah': [
      ModelQuestion(strText: 'Siapakah tokoh yang memproklamasikan kemerdekaan Indonesia bersama Soekarno?', strListOptions: ['Moh. Hatta', 'Sutan Syahrir', 'Ahmad Soebardjo', 'Tan Malaka'], strCorrectAnswer: 0),
      ModelQuestion(strText: 'Perang dunia I dimulai pada tahun?', strListOptions: ['1910', '1914', '1939', '1945'], strCorrectAnswer: 1),
      ModelQuestion(strText: 'Kerajaan Hindu-Buddha terbesar di Nusantara adalah?', strListOptions: ['Sriwijaya', 'Kutai', 'Singasari', 'Majapahit'], strCorrectAnswer: 3),
      ModelQuestion(strText: 'Monumen nasional (Monas) terletak di kota?', strListOptions: ['Bandung', 'Surabaya', 'Yogyakarta', 'Jakarta'], strCorrectAnswer: 3),
      ModelQuestion(strText: 'Siapakah penemu bola lampu pijar?', strListOptions: ['Isaac Newton', 'Thomas Edison', 'Galileo Galilei', 'Albert Einstein'], strCorrectAnswer: 1),
    ],
  };

  List<ModelQuestion> get selectedQuestionList {
    String categoryName = widget.category.strName!;
    return _questionMap[categoryName] ?? _questionMap['Umum']!;
  }
  
  void selectAnswer(int answerIndex) {
    if (isAnswered) return;

    setState(() {
      selectedAnswer = answerIndex;
      isAnswered = true;
    });

    HapticFeedback.lightImpact();

    if (answerIndex == selectedQuestionList[currentQuestionIndex].strCorrectAnswer) {
      yourScore++;
    }
    
    Future.delayed(const Duration(milliseconds: 1500), () { 
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < selectedQuestionList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        isAnswered = false;
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => PageResult(
          score: yourScore,
          totalQuestions: selectedQuestionList.length,
          category: widget.category,
          userName: widget.userName) 
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = selectedQuestionList[currentQuestionIndex];

    return Scaffold(
      backgroundColor: primaryBackground, 
      body: Container(
        decoration: BoxDecoration(
          color: surfaceColor, 
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0), 
            topRight: Radius.circular(0),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // Header dan Progress Bar
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PageHome(userName: widget.userName)));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: Colors.white70, 
                    ), 
                  ), 
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: (currentQuestionIndex + 1) / selectedQuestionList.length,
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.category.strColor,
                            borderRadius: BorderRadius.circular(5),
                          ), 
                        ), 
                      ), 
                    ), 
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${currentQuestionIndex + 1}/${selectedQuestionList.length}',
                    style: const TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ), 
                  ), 
                ],
              ), 
              
              const SizedBox(height: 32),

              // Kategori dan Soal
              Text(
                'Kategori: ${widget.category.strName}',
                style: TextStyle(
                  fontSize: 14,
                  color: widget.category.strColor 
                ),
              ),
              const SizedBox(height: 16), 
              
              // Kartu Pertanyaan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: primaryBackground, 
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4)
                    ) 
                  ], 
                ), 
                child: Text(
                  question.strText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ), 
                ), 
              ), 
              
              const SizedBox(height: 32),
              
              Expanded(
                child: ListView.builder(
                  itemCount: question.strListOptions!.length,
                  itemBuilder: (context, index) {
                    return AnswerCard(
                      text: question.strListOptions![index],
                      isSelected: selectedAnswer == index,
                      isCorrect: isAnswered && index == question.strCorrectAnswer,
                      isWrong: isAnswered && index != question.strCorrectAnswer && selectedAnswer == index,
                      onTap: () => selectAnswer(index),
                      color: widget.category.strColor!,
                    );
                  }
                ), 
              ), 
            ],
          ),
        ), 
      ), 
    ); 
  }
}