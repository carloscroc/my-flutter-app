import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with icon buttons (no AppBar) to match FlutterFlow layout
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () => context.go('/search'),
                    icon: const Icon(Icons.search),
                    iconSize: 30,
                    padding: const EdgeInsets.all(12),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => context.go('/notifications'),
                    icon: const Icon(Icons.notifications),
                    iconSize: 30,
                    padding: const EdgeInsets.all(12),
                  ),
                ],
              ),
            ),

            // Greeting
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Text(
                'Good Morning, ${userName ?? 'John'}',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 1.05,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Day selector card (dark background)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF14191A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: List.generate(8, (index) {
                          final isActive = index == 3; // sample active
                          return Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: Column(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // TODO: wire up selection state
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: isActive ? Theme.of(context).colorScheme.primary : const Color(0xFF1E2324),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: isActive
                                            ? [BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.18), blurRadius: 8, offset: const Offset(0, 3))]
                                            : null,
                                        border: isActive ? Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5) : null,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${5 + index}',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          color: isActive ? Theme.of(context).colorScheme.onPrimary : const Color(0xFFB0B3B8),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  ['S', 'M', 'T', 'W', 'T', 'F', 'S', 'S'][index],
                                  style: GoogleFonts.inter(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.whatshot, color: Colors.orange),
                          const SizedBox(width: 8),
                          Text('2 days streak', style: GoogleFonts.inter(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Expanded list content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
                children: [
                  // Featured Workouts header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Featured Workouts', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                        TextButton(onPressed: () => context.go('/featured'), child: const Text('See All')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Featured horizontal list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: featuredAsync.when(
                      data: (items) => SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, i) => ItemFeaturedWorkouts(workout: items[i]),
                        ),
                      ),
                      loading: () => const SizedBox(height: 160, child: Center(child: CircularProgressIndicator())),
                      error: (e, st) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Error: $e', style: GoogleFonts.inter(color: Colors.red)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Help card with CTA
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: const Color(0xFF14191A), borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Help us assist you better', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text('Answer a few questions to get best from the app and achieve your goals faster.', style: GoogleFonts.inter(color: Colors.white70)),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: ElevatedButton(
                              onPressed: () => context.go('/assessment'),
                              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              child: Text('Complete Assessment', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Category chips (horizontal)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _CategoryChip(iconAsset: 'assets/images/bodybuilding.svg', label: 'Strength'),
                        const SizedBox(width: 12),
                        _CategoryChip(iconAsset: 'assets/images/trademill.svg', label: 'Cardio'),
                        const SizedBox(width: 12),
                        _CategoryChip(iconAsset: 'assets/images/yoga.svg', label: 'Yoga'),
                        const SizedBox(width: 12),
                        _CategoryChip(iconAsset: 'assets/images/walk.svg', label: 'Walking'),
                        const SizedBox(width: 12),
                        _CategoryChip(iconAsset: 'assets/images/swimming.svg', label: 'Swimming'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Workouts For You header and horizontal gallery
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Workouts For You', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: featuredAsync.when(
                      data: (items) => SizedBox(
                        height: 300,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, i) => ItemFeaturedWorkouts(workout: items[i]),
                        ),
                      ),
                      loading: () => const SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
                      error: (e, st) => const SizedBox.shrink(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Meditative mornings horizontal list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Meditative Mornings', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                        TextButton(onPressed: () => context.go('/meditative'), child: const Text('See All')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: medAsync.when(
                      data: (items) => SizedBox(
                        height: 320,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, i) => ItemMeditiveVertical(meditation: items[i]),
                        ),
                      ),
                      loading: () => const SizedBox(height: 160, child: Center(child: CircularProgressIndicator())),
                      error: (e, st) => const SizedBox.shrink(),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String iconAsset;
  final String label;
  const _CategoryChip({required this.iconAsset, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          // Use SvgPicture directly where available; fallback to Icon
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(width: 24, height: 24, child: Image.asset(iconAsset, fit: BoxFit.contain)),
          ),
          Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
