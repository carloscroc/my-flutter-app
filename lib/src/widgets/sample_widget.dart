import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  final String label;
  const SampleWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label),
    );
  }
}
