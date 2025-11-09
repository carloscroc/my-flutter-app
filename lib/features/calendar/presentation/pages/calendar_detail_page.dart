import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/theme/app_theme.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDetailPage extends StatefulWidget {
  final DateTime? initialDate;

  const CalendarDetailPage({
    super.key,
    this.initialDate,
  });

  @override
  State<CalendarDetailPage> createState() => _CalendarDetailPageState();
}

class _CalendarDetailPageState extends State<CalendarDetailPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // Mock workout data - replace with actual data from repository
  final Map<DateTime, List<String>> _workouts = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.initialDate ?? DateTime.now();
    _focusedDay = _selectedDay;
    _loadWorkouts();
  }

  void _loadWorkouts() {
    // Mock data - replace with actual data loading
    final today = DateTime.now();
    _workouts[DateTime(today.year, today.month, today.day)] = [
      'Morning Yoga',
      'Cardio 30min'
    ];
    _workouts[DateTime(today.year, today.month, today.day - 1)] = [
      'Strength Training'
    ];
  }

  List<String> _getWorkoutsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _workouts[key] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final workoutsForSelectedDay = _getWorkoutsForDay(_selectedDay);

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF14191A)
          : AppTheme.primaryBackground,
      appBar: AppBar(
        backgroundColor: isDark
            ? const Color(0xFF1E2324)
            : AppTheme.secondaryBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.primaryText,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Workout Calendar',
          style: TextStyle(
            color: AppTheme.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: AppTheme.primaryColor,
            ),
            onPressed: () => _showAddWorkoutDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF1E2324)
                  : AppTheme.secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _getWorkoutsForDay,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: FlutterFlowTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: FlutterFlowTheme.warning,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(
                  color: isDark ? Colors.white : FlutterFlowTheme.primaryText,
                ),
                weekendTextStyle: TextStyle(
                  color: isDark
                      ? Colors.white70
                      : FlutterFlowTheme.secondaryText,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonDecoration: BoxDecoration(
                  color: FlutterFlowTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                formatButtonTextStyle: TextStyle(
                  color: FlutterFlowTheme.primaryColor,
                ),
                titleTextStyle: TextStyle(
                  color: FlutterFlowTheme.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.primaryText,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: FlutterFlowTheme.primaryText,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: FlutterFlowTheme.secondaryText,
                ),
                weekendStyle: TextStyle(
                  color: FlutterFlowTheme.secondaryText,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF1E2324)
                    : FlutterFlowTheme.secondaryBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Workouts for ${_formatDate(_selectedDay)}',
                        style: TextStyle(
                          color: FlutterFlowTheme.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.fitness_center,
                        color: FlutterFlowTheme.warning,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: workoutsForSelectedDay.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.event_busy,
                                  size: 64,
                                  color: FlutterFlowTheme.secondaryText
                                      .withValues(alpha: 0.5),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No workouts planned',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.secondaryText,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: _showAddWorkoutDialog,
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Workout'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: FlutterFlowTheme.primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: workoutsForSelectedDay.length,
                            itemBuilder: (context, index) {
                              final workout = workoutsForSelectedDay[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                color: isDark
                                    ? const Color(0xFF14191A)
                                    : Colors.white,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: FlutterFlowTheme.primaryColor,
                                    child: const Icon(
                                      Icons.fitness_center,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  title: Text(
                                    workout,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: FlutterFlowTheme.error,
                                    ),
                                    onPressed: () => _deleteWorkout(index),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  void _showAddWorkoutDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Workout'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter workout name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  final key = DateTime(
                    _selectedDay.year,
                    _selectedDay.month,
                    _selectedDay.day,
                  );
                  _workouts[key] = [..._getWorkoutsForDay(_selectedDay), controller.text];
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: FlutterFlowTheme.primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _deleteWorkout(int index) {
    setState(() {
      final key = DateTime(
        _selectedDay.year,
        _selectedDay.month,
        _selectedDay.day,
      );
      final workouts = _getWorkoutsForDay(_selectedDay);
      workouts.removeAt(index);
      if (workouts.isEmpty) {
        _workouts.remove(key);
      } else {
        _workouts[key] = workouts;
      }
    });
  }
}
