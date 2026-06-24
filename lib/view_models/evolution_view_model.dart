import 'package:flutter/material.dart';

import 'package:artriapp/utils/enums/index.dart';

class EvolutionViewModel extends ChangeNotifier {
  final List<int> _fatigueLevels = [];
  List<int> get fatigueLevels => _fatigueLevels;

  final List<int> _sleepLevels = [];
  List<int> get sleepLevels => _sleepLevels;

  final List<int> _painLevelsOnlyNumbers = [];
  List<int> get painLevelsOnlyNumbers => _painLevelsOnlyNumbers;

  void addFatigueLevel(int? newLevel) {
    if (newLevel != null) {
      _fatigueLevels.add(newLevel);
    }
  }

  void addSleepLevel(int? newLevel) {
    if (newLevel != null) {
      _sleepLevels.add(newLevel);
    }
  }

  void addPainLevel(String? bodyOption, int? newLevel) {
    bool bodyOptionExists = BodyOptions.values.any((value) => value.toString() == bodyOption);
    if (bodyOptionExists && newLevel != null) {
      _painLevelsOnlyNumbers.add(newLevel);
      notifyListeners();
    }
  }
}