import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/model/model_category.dart';
import 'package:quizapp/page/page_quiz.dart';

class PageHome extends StatefulWidget {
  final String userName;

  const PageHome({super.key, required this.userName});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  
  final Color primaryBackground = const Color(0xFF1E2749); 
  final Color surfaceColor = const Color(0xFF27335C); 
  final Color mainAccent = const Color(0xFFFFD700); 

  List<ModelCategory> modelCategory = [
    ModelCategory(strName: 'Umum', strIcon: Icons.lightbulb_outline, strColor: const Color(0xFF6C63FF), strDesc: 'Tes Kemampuan Umum', questQount: 5), 
    ModelCategory(strName: 'Sains', strIcon: Icons.science, strColor: const Color(0xFF00C853), strDesc: 'Tes Kemampuan Sains', questQount: 5), 
    ModelCategory(strName: 'Matematika', strIcon: Icons.calculate, strColor: const Color(0xFFFF9800), strDesc: 'Tes Kemampuan Matematika', questQount: 5), 
    ModelCategory(strName: 'Bahasa Inggris', strIcon: Icons.translate, strColor: const Color(0xFFE8624A), strDesc: 'Tes Kemampuan Bahasa Inggris', questQount: 5), 
    ModelCategory(strName: 'Sejarah', strIcon: Icons.history_edu, strColor: const Color(0xFF28C8BD), strDesc: 'Tes Kemampuan Sejarah', questQount: 5), 
  ]; 

  // --- Widget untuk Item Statistik Simetris ---
  // Menggunakan Expanded agar lebar masing-masing kartu sama (simetris)
  Widget buildStatItem(
      String strTitle,
      String strValue,
      IconData strIcon,
      Color strColor) {
    return Expanded( 
      child: Container(
        height: 120, // Tinggi tetap untuk simetris
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 6), // Jarak antar kartu
        decoration: BoxDecoration(
          color: surfaceColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: strColor.withOpacity(0.5), width: 1.5)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(strIcon, color: strColor, size: 28),
            const SizedBox(height: 4),
            Text(
              strValue,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white, 
                fontWeight: FontWeight.bold,
              ), 
            ), 
            Text(
              strTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white70, 
              ), 
            ), 
          ], 
        ), 
      ),
    ); 
  }

  // --- Widget untuk Category Tile (Menggantikan CategoryCard) ---
  Widget buildCategoryTile(ModelCategory category, String userName) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PageQuiz(
            category: category,
            userName: userName),
        ));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(12),
          // Aksen warna di sisi kiri
          border: Border(left: BorderSide(color: category.strColor!, width: 5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 2)
            )
          ]
        ),
        child: Row(
          children: [
            Icon(category.strIcon, color: category.strColor, size: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.strName!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: category.strColor, 
                    ), 
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${category.questQount} Pertanyaan - ${category.strDesc}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70, 
                    ), 
                  ), 
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16)
          ],
        ),
      ),
    );
  }

  // Fungsi Kuis Acak
  void _startRandomQuiz() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      body: CustomScrollView(
        slivers: [
          // Header Kustom menggunakan SliverAppBar
          SliverAppBar(
            backgroundColor: primaryBackground,
            expandedHeight: 200.0, 
            pinned: true, 
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
              centerTitle: false,
              title: const Text(
                'Kategori Kuis',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryBackground, surfaceColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat datang kembali,',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white70, 
                              )
                            ), 
                            Text(
                              widget.userName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, 
                              )
                            ), 
                          ],
                        ), 
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: mainAccent.withOpacity(0.2), 
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.person, 
                            size: 32,
                            color: mainAccent, 
                          ), 
                        ), 
                      ], 
                    ), 
                  ],
                ),
              ),
            ),
          ),

          // Area Body Utama (Statistik + Kategori)
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 24),
                
                // Judul Statistik
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Statistik Singkat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Card Statistik Kuis (ROW SIMETRIS dengan Expanded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18), 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Total Soal
                      buildStatItem('Total Soal', '25+', Icons.quiz, const Color(0xFF6C63FF)), 
                      // Jarak 
                      const SizedBox(width: 12),
                      // 2. Total Kategori
                      buildStatItem('Total Kategori', '5', Icons.category, const Color(0xFF4ECDC4)), 
                      // Jarak
                      const SizedBox(width: 12),
                      // 3. Tingkat Kesulitan
                      buildStatItem('Tingkat Kesulitan', 'Sulit', Icons.trending_up, const Color(0xFFFF9800)),
                    ], 
                  ), 
                ), 
                
                const SizedBox(height: 32),

                // Judul Kategori
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Pilih Kategori Anda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ), 
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Daftar Kategori (Tile Vertikal)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: modelCategory.map((category) {
                      return buildCategoryTile(category, widget.userName);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 80), 
              ],
            ),
          ),
        ],
      ),
      
      // Floating Action Button untuk Kuis Acak
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startRandomQuiz,
        backgroundColor: mainAccent,
        foregroundColor: primaryBackground,
        label: const Text(
          'Kuis Acak!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
        ),
        icon: const Icon(Icons.shuffle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}