import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_provider.dart';
import 'widgets/item_featured_workouts.dart';
import 'widgets/item_meditive_vertical.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredAsync = ref.watch(featuredWorkoutsProvider);
    final medAsync = ref.watch(meditativeMorningsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning, John', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),

            // Day selector (simple horizontal chips)
            SizedBox(
              height: 84,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final isActive = index == 2; // sample active index
                  return Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text('${5 + index}',
                            style: GoogleFonts.inter(
                                color: isActive ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface)),
                      ),
                      const SizedBox(height: 6),
                      Text(['S', 'M', 'T', 'W', 'T', 'F', 'S', 'S'][index], style: GoogleFonts.inter()),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            Row(children: [const Icon(Icons.whatshot, color: Colors.orange), const SizedBox(width: 8), Text('2 days streak', style: GoogleFonts.inter())]),

            const SizedBox(height: 20),
            Text('Featured Workouts', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),

            featuredAsync.when(
              data: (items) => SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => ItemFeaturedWorkouts(workout: items[i]),
                ),
              ),
              loading: () => const SizedBox(height: 160, child: Center(child: CircularProgressIndicator())),
              error: (e, st) => Text('Error: $e'),
            ),

            const SizedBox(height: 20),
            Text('Meditative Mornings', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            medAsync.when(
              data: (items) => Column(children: items.map((m) => ItemMeditiveVertical(meditation: m)).toList()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Error: $e'),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Complete Assessment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
