import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/data/models/meditative_morning.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemMeditiveVertical extends StatelessWidget {
  final MeditativeMorning meditation;
  const ItemMeditiveVertical({super.key, required this.meditation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: Colors.blue.shade200, borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.self_improvement, color: Colors.white),
        ),
        title: Text(meditation.name, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        subtitle: meditation.durationMinutes != null ? Text('${meditation.durationMinutes} min', style: GoogleFonts.inter()) : null,
        onTap: () {},
      ),
    );
  }
}
