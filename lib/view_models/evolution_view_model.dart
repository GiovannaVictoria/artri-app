import 'dart:developer';

import 'package:flutter/material.dart';

class EvolutionViewModel extends ChangeNotifier {
  int _selectedFatigueLevel = 0;
  int get selectedFatigueLevel => _selectedFatigueLevel;
  final List<int> _fatigueLevels = [];
  List<int> get fatigueLevels => _fatigueLevels;

  int _selectedSleepLevel = 0;
  int get selectedSleepLevel => _selectedSleepLevel;
  final List<int> _sleepLevels = [];
  List<int> get sleepLevels => _sleepLevels;

  void addFatigueLevel(int? newLevel) {
    if (newLevel != null) {
      _fatigueLevels.add(newLevel);
    }
  }

  void setSelectedFatigueLevel(int level) {
    _selectedFatigueLevel = level;
    notifyListeners();
  }

  void addSleepLevel(int? newLevel) {
    if (newLevel != null) {
      _sleepLevels.add(newLevel);
    }
  }

  void setSelectedSleepLevel(int level) {
    _selectedSleepLevel = level;
    notifyListeners();
  }
}