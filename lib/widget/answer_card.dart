import 'package:flutter/material.dart';

class AnswerCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onTap;
  final Color color;

  const AnswerCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.onTap,
    required this.color
  });

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> with SingleTickerProviderStateMixin {

  final Color cardDefaultColor = const Color(0xFF1E2749); // Latar belakang kartu default (Dark Navy)

  Color get cardColor {
    if (widget.isCorrect) return Colors.green.shade600;
    if (widget.isWrong) return Colors.redAccent.shade700;
    if (widget.isSelected) return widget.color;
    return cardDefaultColor;
  }

  Color get textColor {
    if (widget.isCorrect || widget.isWrong || widget.isSelected) {
      return Colors.white;
    }
    return Colors.white70; 
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12), // Sudut lebih kecil dan tegas
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4)
              )
            ], 
          ), 
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ), 
                  ), 
                ), 
                // Ikon Feedback
                if (widget.isCorrect) 
                  const Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
                if (widget.isWrong)
                  const Icon(Icons.highlight_off, color: Colors.white, size: 24),
              ],  
            ), 
          ), 
        ), 
      ), 
    );
  }
}