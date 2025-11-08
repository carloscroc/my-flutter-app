import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier {
  // Model for home page state management

  // Add any state variables here
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    // Dispose controllers and streams
    super.dispose();
  }
}
