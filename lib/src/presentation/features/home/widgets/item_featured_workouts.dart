import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/data/models/workout.dart';

class ItemFeaturedWorkouts extends StatelessWidget {
  final Workout workout;
  const ItemFeaturedWorkouts({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(color: Colors.grey[300], child: const Center(child: Icon(Icons.fitness_center)))),
              const SizedBox(height: 8),
              Text(workout.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              if (workout.shortDescription != null) Text(workout.shortDescription!),
            ],
          ),
        ),
      ),
    );
  }
}
