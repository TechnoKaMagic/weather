import 'package:flutter/material.dart';

class TextW extends StatelessWidget {
  final String text;
  final String? subtext; // Optional subtext
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double subtextFontSize;
  final Color subtextColor;
  final FontWeight subtextFontWeight;

  const TextW({
    Key? key,
    required this.text,
    this.subtext, // This can be null
    this.fontSize = 14.0,
      this.color =Colors.white,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.subtextFontSize = 12.0,
    this.subtextColor = Colors.grey,
    this.subtextFontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
        if (subtext != null) // Only show subtext if it's not null
          Text(
            subtext!,
            style: TextStyle(
              fontSize: subtextFontSize,
              color: subtextColor,
              fontWeight: subtextFontWeight,
            ),
          ),
      ],
    );
  }
}
