import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final double? fontSize;
  final Function() onTap;
  final Color? colors;
  // final Size? size;
  final MaterialTapTargetSize? size;
  final BorderRadius? borderRadius;
  final Widget? icon;
  const Button({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.fontSize,
    this.colors,
    this.size,
    this.borderRadius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      textColor: Colors.white,
      onPressed: onTap,
      color: colors,
      // materialTapTargetSize: size,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 8),
          ],
          AppText(
            title: buttonText,
            // colors: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
