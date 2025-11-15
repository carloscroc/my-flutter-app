import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? color;

  const FlutterFlowIconButton({
    required this.icon,
    this.onPressed,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: size, color: color),
      onPressed: onPressed,
    );
  }
}
