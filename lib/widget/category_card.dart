import 'package:flutter/material.dart';
import 'package:quizapp/model/model_category.dart';

// Komponen UI yang digunakan berulang
class CategoryCard extends StatefulWidget {
  final ModelCategory category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.category.strColor!.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8)
            ) 
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.category.strColor!.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16)
              ), 
              child: Icon(
                widget.category.strIcon,
                size: 32,
                color: widget.category.strColor,
              ), 
            ), 
            const SizedBox(height: 12),
            Text(
              widget.category.strName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748)
              ),
            ), 
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                widget.category.strDesc!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4A5568)
                ), 
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ), 
            ), 
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: widget.category.strColor!.withOpacity(0.1),
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