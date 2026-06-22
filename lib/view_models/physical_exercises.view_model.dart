import 'dart:developer';

import 'package:artriapp/models/index.dart';
import 'package:artriapp/routes/index.dart';
import 'package:artriapp/services/index.dart';
import 'package:artriapp/utils/enums/index.dart';
import 'package:artriapp/utils/helpers/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhysicalExercisesViewModel extends ChangeNotifier {
  TrainingType? _currentTrainingType;
  ExerciseDifficulty? _currentDifficulty;
  List<ExerciseQueued> _queuedExercises = [];
  int? _currentExerciseIndex;
  List<ExerciseQueued> get exercises => _queuedExercises;
  ExerciseQueued? get currentExercise => _currentExerciseIndex == null
      ? null
      : _queuedExercises[_currentExerciseIndex ?? 0];
  final List<int> _customExercisesIds = [];
  List<int> get customExercisesIds => _customExercisesIds;
  final List<ExerciseQueued> _queuedCustomExercises = [];
  List<ExerciseQueued> get queuedCustomExercises => _queuedCustomExercises;
  ExerciseQueued? get currentCustomExercise => _currentExerciseIndex == null
      ? null
      : _queuedCustomExercises[_currentExerciseIndex ?? 0];
  int _trainingId = 0;

  final PhysicalExercisesService _physicalExercisesService;
  
  // Cache para armazenar os exercícios de cada categoria de forma independente
  final Map<int, List<Exercise>> _customExercisesCache = {};
  List<Exercise> getExercisesForIndex(int index) => _customExercisesCache[index] ?? [];
  
  final int _categoriesCount = CustomType.values.length;
  int get categoriesCount => _categoriesCount;

  PhysicalExercisesViewModel(this._physicalExercisesService);

  void handleTrainingTypeSelection(TrainingType type, BuildContext context) {
    _currentTrainingType = type;

    context.go(_getRouteForTrainingType(type));
  }

  String _getRouteForTrainingType(TrainingType type) {
    switch (type) {
      case TrainingType.hands:
        return PhysicalExerciseRoutes.handExercises;
      case TrainingType.feet:
        return PhysicalExerciseRoutes.feetExercises;
      case TrainingType.custom:
        return PhysicalExerciseRoutes.customExercises;
      default:
        return PhysicalExerciseRoutes.customExercises;
    }
  }

  void handleDifficultySelection(
    ExerciseDifficulty difficulty,
    BuildContext context,
  ) async {
    _currentDifficulty = difficulty;

    if (_currentTrainingType == null) {
      log('Error: Training type not selected');
      return;
    }

    var currentPath = RouterHelper.getUriFromContext(context);

    try {
      var exercises = await _physicalExercisesService.getExercisesFromTraining(
        _currentTrainingType!,
        _currentDifficulty!,
      );

      _queuedExercises = _queueExercises(exercises);

      context.push('$currentPath/${difficulty.toString()}');
    } catch (e) {
      log('Error fetching exercises: $e');
    }
  }

  List<ExerciseQueued> _queueExercises(List<Exercise> exercises) {
    var queue = exercises
        .map(
          (e) => ExerciseQueued(
            exercise: e,
            isFirst: exercises.indexOf(e) == 0,
            isLast: exercises.indexOf(e) == exercises.length - 1,
          ),
        )
        .toList();

    _currentExerciseIndex = 0;

    return queue;
  }

  int getTrainingId(BuildContext context) {
    String? trainingIdRaw = RouterHelper.getPathParameterFromContext(context, 'trainingId');
    _trainingId = int.tryParse(trainingIdRaw ?? '0') ?? 0;
    return _trainingId;
  }

  void handleNextExercise(BuildContext context) {
    if (_currentExerciseIndex == null) {
      log('Error: No current exercise');
      return;
    }

    if (currentExercise!.isLast) {
      context.go(PhysicalExerciseRoutes.congratulations);
      return;
    }

    _currentExerciseIndex = _currentExerciseIndex! + 1;

    context.go(getExerciseRoute(context));
  }

  void handlePreviousExercise(BuildContext context) {
    if (_currentExerciseIndex == null) {
      log('Error: No current exercise');
      return;
    }

    if (currentExercise!.isFirst) {
      log('Info: Already at the first exercise');
      return;
    }

    _currentExerciseIndex = _currentExerciseIndex! - 1;

    context.go(getExerciseRoute(context));
  }

  void handleStartExercises(BuildContext context) {
    _currentExerciseIndex = 0;

    context.go(getExerciseRoute(context));
  }

  void handleCompleteExercise(BuildContext context) {
    if (_currentExerciseIndex == null) {
      log('Error: No current exercise');
      return;
    }

    currentExercise!.markAsCompleted();
    handleNextExercise(context);
  }

  void handleStartCustomExercisesSelection(BuildContext context) async {
    try {
      var currentPath = RouterHelper.getUriFromContext(context);
      int startIndex = 0;
      
      _customExercisesCache[startIndex] = await _physicalExercisesService.getCustomExercisesFromTraining(
          TrainingType.custom, 
          _currentDifficulty ?? ExerciseDifficulty.easy, 
          startIndex,
      );
      
      notifyListeners();
      context.push('$currentPath/$startIndex');
    } catch (e) {
      log('Error fetching trainings: $e');
    }
  }

  void handleUpdateIndexCustomTraining(BuildContext context, int currentIndex) async {
    int nextIndex = currentIndex + 1;
    if (nextIndex == _categoriesCount) {
      // TODO: implementar finalização
      log('_customExercisesIds: $_customExercisesIds');
    } else {
      try {
        if (!_customExercisesCache.containsKey(nextIndex)) {
          _customExercisesCache[nextIndex] = await _physicalExercisesService.getCustomExercisesFromTraining(
              TrainingType.custom, 
              _currentDifficulty ?? ExerciseDifficulty.easy, 
              nextIndex,
          );
        }
        
        notifyListeners();
        
        var currentPath = RouterHelper.getUriFromContext(context);
        var currentPathSegments = currentPath.pathSegments;
        var cleanedPath = '/${currentPathSegments.sublist(0, currentPathSegments.length - 1).join('/')}';

        context.push('$cleanedPath/$nextIndex');
      } catch (e) {
        log('Error fetching next category: $e');
      }
    }
  }

  void toggleCustomExerciseSelection(int id) {
    if (_customExercisesIds.contains(id)) {
      _customExercisesIds.remove(id);
    } else {
      _customExercisesIds.add(id);
    }
    notifyListeners();
  }

  String getExerciseRoute(BuildContext context) {
    var currentPath = RouterHelper.getUriFromContext(context);
    var currentPathSegments = currentPath.pathSegments;
    var hasCurrentExerciseId = int.tryParse(currentPathSegments.last) != null;
    var cleanedPath = currentPath.path;

    if (hasCurrentExerciseId) {
      cleanedPath =
          '/${currentPathSegments.sublist(0, currentPathSegments.length - 1).join('/')}';
    }

    return '$cleanedPath/${currentExercise!.id}';
  }
}
