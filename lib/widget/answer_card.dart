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

  Color get cardColor {
    if (widget.isCorrect) return Colors.green;
    if (widget.isWrong) return Colors.redAccent;
    if (widget.isSelected) return widget.color;
    return Colors.white;
  }

  Color get textColor {
    if (widget.isCorrect || widget.isWrong || widget.isSelected) {
      return Colors.white;
    }
    return Color(0xFF2D3748);
  } 

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 8)
                )
                        ], 
                      ), 
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.text,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ), 
                              ), 
                            ), 
                            if (widget.isCorrect) 
                                            Icon(Icons.check_circle, color: Colors.white, size: 24),
                                          if (widget.isWrong)
                                            Icon(Icons.cancel, color: Colors.white, size: 24),
                                        ],  
                                      ), 
                                    ), 
                                  ), 
                                ), 
                              );
                            }
                          }                          