import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_flutter_app/src/core/providers/user_provider.dart';
import 'home_provider.dart';
import 'widgets/item_featured_workouts.dart';
import 'widgets/item_meditive_vertical.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredAsync = ref.watch(featuredWorkoutsProvider);
    final medAsync = ref.watch(meditativeMorningsProvider);

    final userName = ref.watch(userNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        actions: [
          IconButton(onPressed: () => context.go('/notifications'), icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () => context.go('/search'), icon: const Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.goodMorning(userName), style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700)),
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
            Row(children: [const Icon(Icons.whatshot, color: Colors.orange), const SizedBox(width: 8), Text(AppLocalizations.of(context)!.twoDaysStreak, style: GoogleFonts.inter())]),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.featuredWorkouts, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                TextButton(onPressed: () => context.go('/featured'), child: Text(AppLocalizations.of(context)!.seeAll)),
              ],
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.meditativeMornings, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                TextButton(onPressed: () => context.go('/meditative'), child: Text(AppLocalizations.of(context)!.seeAll)),
              ],
            ),
            const SizedBox(height: 12),
            medAsync.when(
              data: (items) => Column(children: items.map((m) => ItemMeditiveVertical(meditation: m)).toList()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Error: $e'),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => context.go('/assessment'),
                child: Text(AppLocalizations.of(context)!.completeAssessment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
