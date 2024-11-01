import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? colors;
  const AppText(
      {super.key,
      required this.title,
      this.fontSize,
      this.fontWeight,
      this.colors});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        title,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: colors),
      ),
    );
  }
}
