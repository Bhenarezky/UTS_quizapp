import 'package:flutter/material.dart';
import 'package:quizapp/model/model_category.dart';

class CategoryCard extends StatefulWidget {
  final ModelCategory category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> with SingleTickerProviderStateMixin {
  
  final Color surfaceColor = const Color(0xFF27335C); 
  final Color primaryBackground = const Color(0xFF1E2749); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4)
            ) 
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.category.strColor!.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)
              ), 
              child: Icon(
                widget.category.strIcon,
                size: 36, // Ikon lebih besar
                color: widget.category.strColor,
              ), 
            ), 
            const SizedBox(height: 16),
            // Nama Kategori
            Text(
              widget.category.strName!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ), 
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.category.strDesc!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white60
                ), 
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ), 
            ), 
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: primaryBackground, 
                borderRadius: BorderRadius.circular(8)
              ), 
              child: Text(
                '${widget.category.questQount} Soal',
                style: TextStyle(
                  fontSize: 10,
                  color: widget.category.strColor,
                  fontWeight: FontWeight.bold
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}