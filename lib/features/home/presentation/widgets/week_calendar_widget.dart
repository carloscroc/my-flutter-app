import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/theme/app_theme.dart';

class WeekCalendarWidget extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateTap;

  const WeekCalendarWidget({
    super.key,
    this.selectedDate,
    this.onDateTap,
  });

  @override
  State<WeekCalendarWidget> createState() => _WeekCalendarWidgetState();
}

class _WeekCalendarWidgetState extends State<WeekCalendarWidget> {
  late PageController _pageController;
  late DateTime _currentWeekStart;
  int _currentPage = 1000; // Start at middle page for infinite scroll

  @override
  void initState() {
    super.initState();
    _currentWeekStart = _getWeekStart(DateTime.now());
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  DateTime _getWeekStart(DateTime date) {
    // Get Sunday of the week containing this date
    return date.subtract(Duration(days: date.weekday % 7));
  }

  List<DateTime> _getWeekDates(int pageOffset) {
    final weekStart = _currentWeekStart.add(Duration(days: 7 * pageOffset));
    return List.generate(7, (index) => weekStart.add(Duration(days: index)));
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isSelected(DateTime date) {
    if (widget.selectedDate == null) return false;
    return date.year == widget.selectedDate!.year &&
        date.month == widget.selectedDate!.month &&
        date.day == widget.selectedDate!.day;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Subtle translucent values for light theme
    final dayContainerColor = Colors.white.withOpacity(isDark ? 0.03 : 0.12);
    final dayTextColor = isDark ? const Color(0xFFBDBDBD) : AppTheme.secondaryText;
    final dayNumberColor = isDark ? Colors.white : AppTheme.primaryText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTokens.cardRadius),
        child: Stack(
          children: [
            // Blurred backdrop
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            // Glass container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTokens.cardRadius),
                boxShadow: AppTokens.cardShadow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 80,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemBuilder: (context, pageIndex) {
                          final pageOffset = pageIndex - 1000;
                          final weekDates = _getWeekDates(pageOffset);

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: weekDates.map((date) {
                              final isToday = _isToday(date);
                              final isSelected = _isSelected(date);
                              final dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                              return GestureDetector(
                                onTap: () => widget.onDateTap?.call(date),
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: isToday
                                        ? AppTheme.primaryColor
                                        : (isSelected
                                            ? AppTheme.primaryColor.withOpacity(0.12)
                                            : dayContainerColor),
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected && !isToday
                                        ? Border.all(
                                            color: AppTheme.primaryColor,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                        dayNames[date.weekday % 7],
                                        style: (isToday
                                            ? Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(color: Colors.white)
                                            : Theme.of(context).textTheme.labelMedium?.copyWith(color: dayTextColor))
                                          ?? const TextStyle(fontSize: 12),
                                        ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${date.day}',
                                        style: (isToday
                                                ? AppTheme.metricDisplay.copyWith(color: Colors.white, fontSize: 16)
                                                : Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16, color: dayNumberColor))
                                            ?? const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fitness_center,
                          color: AppTheme.warning,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Workout Streak',
                          style: TextStyle(
                            color: dayTextColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
