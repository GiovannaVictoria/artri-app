import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:artriapp/utils/enums/index.dart';
import 'package:artriapp/services/index.dart';
import 'package:fl_chart/fl_chart.dart';

class EvolutionViewModel extends ChangeNotifier {
  final List<int> _fatigueLevels = [];
  List<int> get fatigueLevels => _fatigueLevels;

  final List<int> _sleepLevels = [];
  List<int> get sleepLevels => _sleepLevels;

  final List<int> _painLevelsOnlyNumbers = [];
  List<int> get painLevelsOnlyNumbers => _painLevelsOnlyNumbers;

  final List<int> _swellingLevelsOnlyNumbers = [];
  List<int> get swellingLevelsOnlyNumbers => _swellingLevelsOnlyNumbers;

  final UserDiaryService _diaryService = UserDiaryService();

  EvolutionViewModel() {
    loadPainData();
  }

  Future<void> loadPainData() async {
    try {
      final painData = await _diaryService.getPainLevels();

      _painLevelsOnlyNumbers.clear();
      _painLevelsOnlyNumbers.addAll(painData);

      notifyListeners();
    } catch (e) {
      log('Erro ao carregar dados: $e');
    }
  }

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

  void addSwellingLevel(String? bodyOption, int? newLevel) {
    bool bodyOptionExists = BodyOptions.values.any((value) => value.toString() == bodyOption);
    if (bodyOptionExists && newLevel != null) {
      _swellingLevelsOnlyNumbers.add(newLevel);
      notifyListeners();
    }
  }

  Future<void> addPainLevel(String? bodyOption, int? newLevel) async {
    try {
      bool bodyOptionExists = BodyOptions.values.any((value) => value.toString() == bodyOption);
      if (bodyOption == null || newLevel == null || !bodyOptionExists) return;
      await _diaryService.addPainLevel(bodyOption, newLevel);
      _painLevelsOnlyNumbers.add(newLevel);
      notifyListeners();
    } catch (e) {
      log('Erro ao salvar: $e');
    }
  }

  List<FlSpot> getLast7PainLevels() {
    List<FlSpot> last7PainSpots = [];
    int spotIndex = 0;
    int levelIndex = _painLevelsOnlyNumbers.length >= 7 ? _painLevelsOnlyNumbers.length - 7 : 0;

    for (; levelIndex < _painLevelsOnlyNumbers.length && spotIndex < 7; levelIndex++, spotIndex++) {
      last7PainSpots.add(FlSpot(spotIndex.toDouble(), _painLevelsOnlyNumbers[levelIndex].toDouble()));
    }

    return last7PainSpots;
  }
}