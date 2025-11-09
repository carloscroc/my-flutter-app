import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier {
  // Model for home page state management

  // Add any state variables here
  int _selectedIndex = 0;
  DateTime? _selectedDate;

  int get selectedIndex => _selectedIndex;
  DateTime? get selectedDate => _selectedDate;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void navigateToCalendarDetail(BuildContext context) {
    // Navigation will be handled in the page
  }

  @override
  void dispose() {
    // Dispose controllers and streams
    super.dispose();
  }
}
