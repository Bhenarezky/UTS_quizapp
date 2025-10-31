import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/page/page_quiz.dart';

import '../widget/category_card.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

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
      questCount: 50,
    ), 
    ModelCategory(
      strName: 'Sains',
      strIcon: Icons.science,
      strColor: const Color(0xFF00C853),
      strDesc: 'Tes Kemampuan Sains',
      questCount: 25,
    ), 
    ModelCategory(
      strName: 'Bahasa Inggris',
      strIcon: Icons.translate,
      // Kode warna 0xFFFE8624A diperbaiki menjadi 0xFFE8624A (asumsi)
      strColor: const Color(0xFFE8624A), 
      strDesc: 'Tes Kemampuan Bahasa Inggris',
      questCount: 20,
    ), 
    ModelCategory(
      strName: 'Sejarah',
      strIcon: Icons.history_edu,
      strColor: const Color(0xFF28C8BD),
      strDesc: 'Tes Kemampuan Sejarah',
      questCount: 30,
    ), 
  ]; 

  // --- Metode Build Widget Statistik Item ---

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

  // --- Metode Build Halaman Utama ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Gradien latar belakang halus
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
            // Perbaikan: EdgeInsetsGeometry.all(24) menjadi EdgeInsets.all(24)
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                
                // Header (Pesan Selamat Datang & Ikon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Selamat datang kembali!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )
                        ), 
                        SizedBox(height: 4),
                        Text(
                          'Azhar Rivaldi',
                          style: TextStyle(
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
                        // Kode warna 0xFFFEDF2F7 diperbaiki menjadi 0xFFEDF2F7 (asumsi)
                        color: const Color(0xFFEDF2F7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: const Icon(
                        Icons.playlist_add_check_circle,
                        size: 32,
                        // Kode warna 0xFFFE91E63 diperbaiki menjadi 0xFFE91E63 (asumsi)
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
                      // Item Statistik 1
                      Expanded(
                        // Perbaikan: buildSateItem menjadi buildStatItem
                        child: buildStatItem( 
                          'Total Soal',
                          '125+',
                          Icons.quiz,
                          const Color(0xFF6C63FF),
                        )
                      ), 
                      // Pembatas Vertikal
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ), 
                      // Item Statistik 2
                      Expanded(
                        // Perbaikan: buildSateItem menjadi buildStatItem
                        child: buildStatItem( 
                          'Total Kategori',
                          '4',
                          Icons.category,
                          const Color(0xFF4ECDC4)
                        )
                      ), 
                      // Pembatas Vertikal
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ), 
                      // Item Statistik 3
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
                          children: [
                            const Text(
                              'Mulai Sekarang?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ), 
                            ),
                            const SizedBox(height: 8),
                            // Perbaikan: Tanda titik koma (;) pada style diubah menjadi koma (,)
                            const Text(
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
                          
                          // Pilih kategori secara acak
                          final randomCategories = modelCategory.toList()..shuffle().first;

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PageQuiz(
                              category: randomCategories
                            ),
                          ));
                        }, 
                        style: ElevatedButton.styleFrom(
                          // Kode warna 0xFFFE91E63 diperbaiki menjadi 0xFFE91E63 (asumsi)
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
                            category: modelCategory[index]),
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