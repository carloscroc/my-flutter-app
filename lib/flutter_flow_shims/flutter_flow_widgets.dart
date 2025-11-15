import 'package:flutter/material.dart';

class FFButtonOptions {
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  const FFButtonOptions({this.color, this.textColor, this.padding});
}

class FFButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final FFButtonOptions? options;
  final Key? buttonKey;

  const FFButtonWidget({
    this.buttonKey,
    required this.text,
    this.onPressed,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: buttonKey,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: options?.color,
        padding: options?.padding,
      ),
      child: Text(
        text,
        style: TextStyle(color: options?.textColor),
      ),
    );
  }
}
