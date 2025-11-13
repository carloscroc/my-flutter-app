import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/data/models/workout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemFeaturedWorkouts extends StatelessWidget {
  final Workout workout;
  const ItemFeaturedWorkouts({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final cardW = math.min(320, screenW * 0.72);

    return SizedBox(
      width: cardW,
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
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: workout.photoUrl != null
                      ? Semantics(
                          label: workout.name,
                          child: Image.network(
                            workout.photoUrl!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stack) => Center(
                              child: SvgPicture.asset(
                                'assets/images/bodybuilding.svg',
                                width: 96,
                                height: 64,
                                fit: BoxFit.contain,
                                semanticsLabel: 'Workout image',
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: SvgPicture.asset(
                            'assets/images/bodybuilding.svg',
                            width: 96,
                            height: 64,
                            fit: BoxFit.contain,
                            semanticsLabel: workout.name,
                          ),
                        ),
                ),
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
