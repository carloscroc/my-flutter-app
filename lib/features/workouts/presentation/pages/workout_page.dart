import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/flutter_flow_theme.dart';
import '../../domain/models/workout_page_model.dart';
import '../widgets/item_featured_workouts_widget.dart';
import '../widgets/item_workout_big_widget.dart';

/// TODO: Asset Requirements
/// The following SVG assets are referenced but using Flutter Icons as placeholders:
/// - assets/images/abdominals.svg
/// - assets/images/biceps-muscle.svg
/// - assets/images/hamstrings.svg
/// - assets/images/chest-muscle.svg
///
/// The following PNG assets are referenced:
/// - assets/images/4d4l3g.png (Kettlebell Workout)
/// - assets/images/n0sdfy.png (Weight Lifting)
/// - assets/images/qvsomv.png (Start your Morning)
///
/// Currently using Flutter Icons and network images as placeholders

class WorkoutPageWidget extends StatefulWidget {
  const WorkoutPageWidget({super.key});

  static String routeName = 'WorkoutPage';
  static String routePath = '/workoutPage';

  @override
  State<WorkoutPageWidget> createState() => _WorkoutPageWidgetState();
}

class _WorkoutPageWidgetState extends State<WorkoutPageWidget> {
  late WorkoutPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = WorkoutPageModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Workouts',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.titleLarge.copyWith(
                                fontFamily: 'Inter',
                                color: const Color(0xFFF8F8F8),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.bookmark_border,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () {
                            // TODO: Implement bookmark functionality
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () {
                            // TODO: Implement search functionality
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Consumer<WorkoutPageModel>(
                    builder: (context, model, child) {
                      if (model.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.primaryColor,
                            ),
                          ),
                        );
                      }

                      return ListView(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        children: [
                          // Category Filters
                          _buildCategoryFilters(),

                          const SizedBox(height: 24),

                          // Workouts For You Section
                          _buildFeaturedSection(
                            title: 'Workouts For You',
                            workouts: model.featuredWorkouts,
                          ),

                          const SizedBox(height: 24),

                          // Challenges Section
                          _buildChallengesSection(model),

                          const SizedBox(height: 24),

                          // Perfect For Home Section
                          _buildPerfectForHomeSection(model),

                          const SizedBox(height: 24),

                          // Body Focus Section
                          _buildBodyFocusSection(),

                          const SizedBox(height: 24),

                          // With Equipment Section
                          _buildWithEquipmentSection(),

                          const SizedBox(height: 24),

                          // Difficulty Level Cards
                          _buildDifficultyLevels(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildCategoryChip('All', isSelected: true),
          const SizedBox(width: 16),
          _buildCategoryChip('Strength', icon: Icons.fitness_center),
          const SizedBox(width: 16),
          _buildCategoryChip('Yoga', icon: Icons.self_improvement),
          const SizedBox(width: 16),
          _buildCategoryChip('Stretching', icon: Icons.accessibility_new),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {IconData? icon, bool isSelected = false}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF333300) : FlutterFlowTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFFF8F8F8), size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: FlutterFlowTheme.bodyMedium.copyWith(
                fontFamily: 'Inter',
                color: const Color(0xFFF8F8F8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSection({
    required String title,
    required List workouts,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: FlutterFlowTheme.titleLarge.copyWith(
                fontFamily: 'Inter',
                color: const Color(0xFFF8F8F8),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to featured workouts page
              },
              child: Text(
                'See All',
                style: FlutterFlowTheme.bodyMedium.copyWith(
                  fontFamily: 'Inter',
                  color: const Color(0xFFBEBFC2),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: workouts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return ItemFeaturedWorkoutsWidget(
                imageUrl: workout.photoUrl,
                name: workout.name,
                onTap: () {
                  // TODO: Navigate to workout detail
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChallengesSection(WorkoutPageModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Challenges',
              style: FlutterFlowTheme.titleLarge.copyWith(
                fontFamily: 'Inter',
                color: const Color(0xFFF8F8F8),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to challenges page
              },
              child: Text(
                'See All',
                style: FlutterFlowTheme.bodyMedium.copyWith(
                  fontFamily: 'Inter',
                  color: const Color(0xFFBEBFC2),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: model.challenges.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final challenge = model.challenges[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fadeInDuration: const Duration(milliseconds: 500),
                  fadeOutDuration: const Duration(milliseconds: 500),
                  imageUrl: challenge.photoUrl,
                  width: 155,
                  height: 155,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: FlutterFlowTheme.secondaryBackground,
                    child: const Icon(
                      Icons.emoji_events,
                      size: 50,
                      color: Colors.white54,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPerfectForHomeSection(WorkoutPageModel model) {
    final homeWorkouts = model.homeWorkouts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Perfect For Home',
              style: FlutterFlowTheme.titleLarge.copyWith(
                fontFamily: 'Inter',
                color: const Color(0xFFF8F8F8),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to home workouts page
              },
              child: Text(
                'See All',
                style: FlutterFlowTheme.bodyMedium.copyWith(
                  fontFamily: 'Inter',
                  color: const Color(0xFFBEBFC2),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: homeWorkouts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final workout = homeWorkouts[index];
              return ItemWorkoutBigWidget(
                name: workout.name,
                photoUrl: workout.photoUrl,
                onTap: () {
                  // TODO: Navigate to workout detail
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBodyFocusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Body Focus',
              style: FlutterFlowTheme.titleLarge.copyWith(
                fontFamily: 'Inter',
                color: const Color(0xFFF8F8F8),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to body focus page
              },
              child: Text(
                'See All',
                style: FlutterFlowTheme.bodyMedium.copyWith(
                  fontFamily: 'Inter',
                  color: const Color(0xFFBEBFC2),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildBodyFocusCard('Abs and Core', Icons.emoji_people),
            _buildBodyFocusCard('Arms & Shoulders', Icons.fitness_center),
            _buildBodyFocusCard('Glutes & Legs', Icons.directions_run),
            _buildBodyFocusCard('Chest', Icons.accessibility_new),
          ],
        ),
      ],
    );
  }

  Widget _buildBodyFocusCard(String title, IconData icon) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to filtered workouts
      },
      child: Container(
        height: 151,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
                color: const Color(0xFFF8F8F8),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyMedium.copyWith(
                  fontFamily: 'Inter',
                  color: const Color(0xFFF8F8F8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWithEquipmentSection() {
    final equipmentWorkouts = [
      {
        'name': 'Kettlebell Workout',
        'difficulty': 'Beginner',
        'image': 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?w=400&h=400&fit=crop',
      },
      {
        'name': 'Weight Lifting',
        'difficulty': 'Intermediate',
        'image': 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?w=400&h=400&fit=crop',
      },
      {
        'name': 'Start your Morning',
        'difficulty': 'Beginner',
        'image': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=400&fit=crop',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'With Equipment',
              style: FlutterFlowTheme.titleLarge.copyWith(
                fontFamily: 'Inter',
                color: const Color(0xFFF8F8F8),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to equipment workouts
              },
              child: Text(
                'See All',
                style: FlutterFlowTheme.bodyMedium.copyWith(
                  fontFamily: 'Inter',
                  color: const Color(0xFFBEBFC2),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: equipmentWorkouts.map((workout) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: workout['image'] as String,
                        width: 193,
                        height: 188,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(
                          width: 193,
                          height: 188,
                          color: FlutterFlowTheme.secondaryBackground,
                          child: const Icon(
                            Icons.fitness_center,
                            size: 60,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      workout['name'] as String,
                      style: FlutterFlowTheme.bodyMedium.copyWith(
                        fontFamily: 'Inter',
                        color: const Color(0xFFF8F8F8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      workout['difficulty'] as String,
                      style: FlutterFlowTheme.bodySmall.copyWith(
                        fontFamily: 'Inter',
                        color: const Color(0xFFA1A2A6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDifficultyLevels() {
    return Column(
      children: [
        _buildDifficultyCard('Beginner Workouts', 1),
        const SizedBox(height: 16),
        _buildDifficultyCard('Intermediate Workouts', 3),
        const SizedBox(height: 16),
        _buildDifficultyCard('Advanced Workouts', 3),
        const SizedBox(height: 16),
        _buildAllWorkoutsCard(),
      ],
    );
  }

  Widget _buildDifficultyCard(String title, int fireIcons) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to filtered workouts by difficulty
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.secondaryBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.titleMedium.copyWith(
                    fontFamily: 'Inter',
                    color: const Color(0xFFF8F8F8),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: List.generate(
                    fireIcons,
                    (index) => const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.local_fire_department,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAllWorkoutsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'All Workouts',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.titleMedium.copyWith(
              fontFamily: 'Inter',
              color: const Color(0xFFF8F8F8),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
