import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final double? fontSize;
  final Function() onTap;
  final Color? colors;
  final Size? size;
  final BorderRadius? borderRadius;
  const Button({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.fontSize,
    this.colors,
    this.size,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          minimumSize: size, elevation: 0, backgroundColor: Colors.black54),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: fontSize, color: colors),
      ),
    );
  }
}
