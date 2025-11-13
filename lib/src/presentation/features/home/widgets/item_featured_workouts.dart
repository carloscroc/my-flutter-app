import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/data/models/workout.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemFeaturedWorkouts extends StatelessWidget {
  final Workout workout;
  const ItemFeaturedWorkouts({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: const Center(child: Icon(Icons.fitness_center, size: 48, color: Colors.white70)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(workout.name, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700)),
                  if (workout.shortDescription != null) ...[
                    const SizedBox(height: 6),
                    Text(workout.shortDescription!, style: GoogleFonts.inter(color: Colors.grey[700])),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
