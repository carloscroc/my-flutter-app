import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/theme/app_theme.dart';
import 'package:my_flutter_app/features/home/domain/models/home_model.dart';
import 'package:my_flutter_app/features/home/presentation/widgets/item_featured_workouts_widget.dart';
import 'package:my_flutter_app/features/home/presentation/widgets/item_meditative_vertical_widget.dart';
import 'package:my_flutter_app/features/home/presentation/widgets/week_calendar_widget.dart';
import 'package:my_flutter_app/features/calendar/presentation/pages/calendar_detail_page.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = HomePageModel();
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
          backgroundColor: AppTheme.primaryBackground,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with notification and search icons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined),
                          color: AppTheme.primaryText,
                          iconSize: 28,
                          onPressed: () {
                            // Handle notification tap
                          },
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.search),
                          color: AppTheme.primaryText,
                          iconSize: 28,
                          onPressed: () {
                            // Handle search tap
                          },
                        ),
                      ],
                    ),
                  ),

                  // Welcome section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: AppTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Ready to start your wellness journey?',
                          style: AppTheme.bodyLarge.copyWith(
                            color: AppTheme.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Week Calendar Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: WeekCalendarWidget(
                      selectedDate: _model.selectedDate,
                      onDateTap: (date) {
                        _model.setSelectedDate(date);
                        // Navigate to calendar detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalendarDetailPage(
                              initialDate: date,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Featured Workouts Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured Workouts',
                          style: AppTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 220,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 24),
                            children: [
                              ItemFeaturedWorkoutsWidget(
                                title: 'Morning Yoga',
                                subtitle: '30 min • Beginner',
                                imageUrl:
                                    'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=500',
                                onTap: () {
                                  // Handle workout tap
                                },
                              ),
                              ItemFeaturedWorkoutsWidget(
                                title: 'HIIT Training',
                                subtitle: '20 min • Advanced',
                                imageUrl:
                                    'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=500',
                                onTap: () {
                                  // Handle workout tap
                                },
                              ),
                              ItemFeaturedWorkoutsWidget(
                                title: 'Strength Building',
                                subtitle: '45 min • Intermediate',
                                imageUrl:
                                    'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=500',
                                onTap: () {
                                  // Handle workout tap
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Meditation Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guided Meditation',
                          style: AppTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        ItemMeditiveVerticalWidget(
                          title: 'Morning Mindfulness',
                          subtitle: '10 min • Relaxation',
                          imageUrl:
                              'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=500',
                          onTap: () {
                            // Handle meditation tap
                          },
                        ),
                        ItemMeditiveVerticalWidget(
                          title: 'Deep Sleep',
                          subtitle: '15 min • Sleep',
                          imageUrl:
                              'https://images.unsplash.com/photo-1540206395-68808572332f?w=500',
                          onTap: () {
                            // Handle meditation tap
                          },
                        ),
                        ItemMeditiveVerticalWidget(
                          title: 'Stress Relief',
                          subtitle: '12 min • Breathing',
                          imageUrl:
                              'https://images.unsplash.com/photo-1545389336-cf090694435e?w=500',
                          onTap: () {
                            // Handle meditation tap
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
