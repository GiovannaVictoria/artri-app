import 'dart:developer';

import 'package:flutter/material.dart';

class EvolutionViewModel extends ChangeNotifier {
  int _selectedFatigueLevel = 0;
  int get selectedFatigueLevel => _selectedFatigueLevel;
  final List<int> _fatigueLevels = [];
  List<int> get fatigueLevels => _fatigueLevels;

  void addFatigueLevel(int newLevel) {
    _fatigueLevels.add(newLevel);
  }

  void setSelectedFatigueLevel(int level) {
    _selectedFatigueLevel = level;
    notifyListeners();
  }
}