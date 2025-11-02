import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/page/page_quiz.dart';

import '../widget/category_card.dart';

class PageHome extends StatefulWidget {
  final String userName;

  const PageHome({super.key, required this.userName});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  
  List<ModelCategory> modelCategory = [
    ModelCategory(
      strName: 'Umum',
      strIcon: Icons.lightbulb_outline,
      strColor: const Color(0xFF6C63FF),
      strDesc: 'Tes Kemampuan Umum',
      questQount: 5, 
    ), 
    ModelCategory(
      strName: 'Sains',
      strIcon: Icons.science,
      strColor: const Color(0xFF00C853),
      strDesc: 'Tes Kemampuan Sains',
      questQount: 5,
    ), 
    ModelCategory(
      strName: 'Matematika',
      strIcon: Icons.calculate,
      strColor: const Color(0xFFFF9800),
      strDesc: 'Tes Kemampuan Matematika',
      questQount: 5,
    ), 
    ModelCategory(
      strName: 'Bahasa Inggris',
      strIcon: Icons.translate,
      strColor: const Color(0xFFE8624A), 
      strDesc: 'Tes Kemampuan Bahasa Inggris',
      questQount: 5,
    ), 
    ModelCategory(
      strName: 'Sejarah',
      strIcon: Icons.history_edu,
      strColor: const Color(0xFF28C8BD),
      strDesc: 'Tes Kemampuan Sejarah',
      questQount: 5,
    ), 
  ]; 

  Widget buildStatItem(
    String strTitle,
    String strValue,
    IconData strIcon,
    Color strColor) {
    return Column(
      children: [
        Icon(strIcon, color: strColor, size: 28),
        const SizedBox(height: 6),
        Text(
          strValue,
          style: const TextStyle(
            fontSize: 18, 
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.w900, 
          ), 
        ), 
        const SizedBox(height: 2),
        Text(
          strTitle,
          style: const TextStyle(
            fontSize: 10, 
            color: Color(0xFF4A5568),
          ), 
        ), 
      ], 
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar belakang solid yang lebih bersih
      backgroundColor: const Color(0xFFF0F2FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selamat datang kembali!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300, // Lebih tipis
                          color: Colors.black,
                        )
                      ), 
                      const SizedBox(height: 4),
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontSize: 24, // Dibuat lebih besar
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        )
                      ), 
                    ],
                  ), 
                  // Perubahan Desain: Ikon notifikasi yang lebih sederhana
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      size: 28,
                      color: Color(0xFF4A5568)
                    ), 
                  ), 
                ], 
              ), 
              
              const SizedBox(height: 32),

              // Card Statistik Kuis
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5)
                    ), 
                  ]
                ), 
                child: Row(
                  children: [
                    Expanded(child: buildStatItem('Total Soal', '25+', Icons.quiz, const Color(0xFF6C63FF))), 
                    Container(width: 1, height: 40, color: Colors.grey[200]), // Garis pembatas lebih terang
                    Expanded(child: buildStatItem('Total Kategori', '5', Icons.category, const Color(0xFF4ECDC4))), 
                    Container(width: 1, height: 40, color: Colors.grey[200]), 
                    Expanded(child: buildStatItem('Tingkat Kesulitan', 'Menengah', Icons.trending_up, const Color(0xFFFFB74D))),
                  ], 
                ), 
              ), 
              
              const SizedBox(height: 32),

              // Card Mulai Kuis Acak
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF), // Warna latar belakang yang lebih menarik
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6C63FF).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5)
                    ), 
                  ]
                ), 
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Mulai Kuis Acak!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ), 
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Ikuti kuis acak dari semua kategori.',
                            style: TextStyle(
                                fontSize: 14,
                                color : Colors.white70
                            ),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        
                        final List<ModelCategory> shuffledList = modelCategory.toList();
                        shuffledList.shuffle();
                        final ModelCategory randomCategory = shuffledList.first;
                        
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PageQuiz(
                            category: randomCategory,
                            userName: widget.userName
                          ),
                        ));
                      }, 
                      // Perubahan Desain Tombol: Kontras (Putih/Pink)
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFE91E63),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'MULAI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ), 
                      ),
                    ), 
                  ], 
                ), 
              ),
              
              const SizedBox(height: 32),
              
              const Text(
                'Pilih Kategori Anda:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748)
                ), 
              ),
              
              const SizedBox(height: 20),
              
              // Grid Kategori
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16, // Spasi antar kartu lebih besar
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85, // Rasio sedikit lebih persegi
                ), 
                itemCount: modelCategory.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: modelCategory[index],
                    onTap: () {
                      HapticFeedback.lightImpact();

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PageQuiz(
                          category: modelCategory[index],
                          userName: widget.userName),
                      ));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}