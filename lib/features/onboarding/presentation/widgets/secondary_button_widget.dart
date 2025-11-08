import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/theme/flutter_flow_theme.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;

  const SecondaryButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: FlutterFlowTheme.primaryColor,
          side: const BorderSide(
            color: FlutterFlowTheme.primaryColor,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.primaryColor,
                  ),
                ),
              )
            : Text(
                text,
                style: FlutterFlowTheme.titleMedium.copyWith(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
      ),
    );
  }
}
