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
      questQount: 50, 
    ), 
    ModelCategory(
      strName: 'Sains',
      strIcon: Icons.science,
      strColor: const Color(0xFF00C853),
      strDesc: 'Tes Kemampuan Sains',
      questQount: 25,
    ), 
    ModelCategory(
      strName: 'Bahasa Inggris',
      strIcon: Icons.translate,
      strColor: const Color(0xFFE8624A), 
      strDesc: 'Tes Kemampuan Bahasa Inggris',
      questQount: 20,
    ), 
    ModelCategory(
      strName: 'Sejarah',
      strIcon: Icons.history_edu,
      strColor: const Color(0xFF28C8BD),
      strDesc: 'Tes Kemampuan Sejarah',
      questQount: 30,
    ), 
  ]; 

  Widget buildStatItem(
    String strTitle,
    String strValue,
    IconData strIcon,
    Color strColor) {
    return Column(
      children: [
        Icon(strIcon, color: strColor, size: 24),
        const SizedBox(height: 8),
        Text(
          strValue,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ), 
        ), 
        const SizedBox(height: 4),
        Text(
          strTitle,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF2D3748),
          ), 
        ), 
      ], 
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F9FF),
              Color(0xFFE8EAFF),
              Color(0xFFF0F2FF)
            ]
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                
                // Header (Pesan Selamat Datang & Nama Pengguna)
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
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )
                        ), 
                        const SizedBox(height: 4),
                        // Menggunakan widget.userName
                        Text(
                          widget.userName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )
                        ), 
                      ],
                    ), 
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDF2F7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: const Icon(
                        Icons.playlist_add_check_circle,
                        size: 32,
                        color: Color(0xFFE91E63)
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
                        blurRadius: 10,
                        offset: const Offset(0, 4)
                      ), 
                    ]
                  ), 
                  child: Row(
                    children: [
                      Expanded(
                        child: buildStatItem( 
                          'Total Soal',
                          '125+',
                          Icons.quiz,
                          const Color(0xFF6C63FF),
                        )
                      ), 
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ), 
                      Expanded(
                        child: buildStatItem( 
                          'Total Kategori',
                          '4',
                          Icons.category,
                          const Color(0xFF4ECDC4)
                        )
                      ), 
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ), 
                      Expanded(
                        child: buildStatItem(
                          'Tingkat Kesulitan',
                          'Menengah',
                          Icons.trending_up,
                          const Color(0xFFFFB74D),
                        )
                      ),
                    ], 
                  ), 
                ), 
                
                const SizedBox(height: 32),

                // Card Mulai Kuis Acak
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4)
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
                              'Mulai Sekarang?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ), 
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Ikuti kuis acak sekarang!',
                              style: TextStyle(
                                  fontSize: 14,
                                  color : Colors.black
                              ),
                            ),
                          ],
                        )
                      ),
                      const SizedBox(width: 16),
                      // Tombol Mulai Kuis Acak
                      ElevatedButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          
                          final List<ModelCategory> shuffledList = modelCategory.toList();
                          shuffledList.shuffle();
                          final ModelCategory randomCategory = shuffledList.first;
                          
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PageQuiz(
                              category: randomCategory,
                              userName: widget.userName // Meneruskan userName ke PageQuiz
                            ),
                          ));
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE91E63),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ), 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        child: const Text(
                          'Mulai',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ), 
                        ),
                      ), 
                    ], 
                  ), 
                ),
                
                const SizedBox(height: 32),
                
                // Label "Pilih Kategori"
                const Text(
                  'Pilih Kategori Anda:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
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
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
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
                            userName: widget.userName), // Meneruskan userName ke PageQuiz
                        ));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}