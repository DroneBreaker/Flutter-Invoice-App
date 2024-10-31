import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final double? fontSize;
  final Function() onTap;
  final Color? colors;
  const Button(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.fontSize,
      this.colors});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: fontSize, color: colors),
      ),
      style: TextButton.styleFrom(
          minimumSize: const Size(160, 60),
          elevation: 0,
          backgroundColor: Colors.black54),
    );
  }
}
