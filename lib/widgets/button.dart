import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  const Button({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 15),
      ),
      style:
          TextButton.styleFrom(minimumSize: const Size(150, 55), elevation: 0),
    );
  }
}
