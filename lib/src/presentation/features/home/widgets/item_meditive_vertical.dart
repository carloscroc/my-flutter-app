import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/data/models/meditative_morning.dart';

class ItemMeditiveVertical extends StatelessWidget {
  final MeditativeMorning meditation;
  const ItemMeditiveVertical({super.key, required this.meditation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.self_improvement),
        title: Text(meditation.name),
        subtitle: meditation.durationMinutes != null ? Text('${meditation.durationMinutes} min') : null,
        onTap: () {},
      ),
    );
  }
}
