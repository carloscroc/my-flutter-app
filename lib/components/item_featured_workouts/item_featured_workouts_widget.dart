import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/src/presentation/features/home/widgets/item_featured_workouts.dart';

/// Thin wrapper that maps FlutterFlow-exported import paths to the app's
/// native `ItemFeaturedWorkouts` widget. This avoids changing the FlutterFlow
/// source while keeping the app architecture intact.
class ItemFeaturedWorkoutsWidget extends StatelessWidget {
  const ItemFeaturedWorkoutsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ItemFeaturedWorkouts();
  }
}
