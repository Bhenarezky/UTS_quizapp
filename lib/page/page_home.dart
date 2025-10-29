import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/model/model_category.dart';
import 'package:quiz_app/app/page/page_quiz.dart';

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
      strColor: Color(0xFF6C63FF),
      strDesc: 'Tes Kemampuan Umum',
      questCount: 50,
    ), 
    ModelCategory(
      strName: 'Sains',
      strIcon: Icons.science,
      strColor: Color(0xFF00C853),
      strDesc: 'Tes Kemampuan Sains',
      questCount: 25,
    ), 
    ModelCategory(
      strName: 'Bahasa Inggris',
      strIcon: Icons.translate,
      strColor: Color(0xFFFE8624A),
      strDesc: 'Tes Kemampuan Bahasa Inggris',
      questCount: 20,
    ), 
    ModelCategory(
    strName: 'Sejarah',
    strIcon: Icons.history_edu,
    strColor: Color(0xFF28C8BD),
    strDesc: 'Tes Kemampuan Sejarah',
    questCount: 30,
    ), 
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F9FF),
              Color(0xFFE8EAFF),
              Color(0xFFF0F2FF)
            ] // Penutup colors
          ), // Penutup LinearGradient
        ), // Penutup BoxDecoration
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFFEDF2F7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Icon(
                        Icons.playlist_add_check_circle,
                        size: 32,
                        color: Color(0xFFFE91E63)
                      ), 
                    ), 
                  ], 
                ), 
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4)
                      ), 
                    ]
                  ), 
                  child: Row(
                    children: [
                      Expanded(
                        child: buildSateItem( 
                          'Total Soal',
                          '125+',
                          Icons.quiz,
                          Color(0xFF6C63FF),
                        )
                      ), 
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ), 
                      Expanded(
                        child: buildSateItem( 
                          'Total Kategori',
                          '4',
                          Icons.category,
                          Color(0xFF4ECDC4)
                        )
                      ), 
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ), 
                      Expanded(
                        child: buildSateItem(
                          'Tingkat Kesulitan',
                          'Menengah',
                          Icons.trending_up,
                          Color(0xFFFFB74D),
                        )
                      ), /
                    ], 
                  ), 
                ), 
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4)
                      ), 
                    ]
                  ), 
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  fontSize: 14;
                                  color : Color.black
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                              onPressed: () {
                                HapticFeedback.lightImpact();

                                final randomCategories = modelCategory.toList()..shuffle().first;

                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PageQuiz(
                                    category: randomCategories
                                  ),
                                ));
                              }, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFE91E63),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ), 
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            child: Text(
                              'Mulai',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ), 
                            ),
                          ), 
                        ], 
                      ), 
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Pilih Kategori Anda:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ), 
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildStatItem(
    String strTitle,
    String strValue,
    IconData strIcon,
    Color strColor) {
    return Column(
      children: [
        Icon(strIcon, color: strColor, size: 24),
        SizedBox(height: 8),
        Text(
          strValue,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ), 
        ), 
        SizedBox(height: 4),
        Text(
          strTitle,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF2D3748),
          ), 
        ), 
      ], 
    ); 
  } 
}