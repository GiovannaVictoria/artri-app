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

  final PhysicalExercisesService _physicalExercisesService;
  List<Exercise> _nthCustomExercises = [];
  List<Exercise> get nthCustomExercises => _nthCustomExercises;
  int _indexCustomTraining = 0;
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
      _indexCustomTraining = 0;
      _nthCustomExercises = await _physicalExercisesService.getCustomExercisesFromTraining(TrainingType.custom, _currentDifficulty ?? ExerciseDifficulty.easy, _indexCustomTraining);
      context.push('$currentPath/$_indexCustomTraining');
    } catch (e) {
      log('Error fetching trainings: $e');
    }
  }

  void handleUpdateIndexCustomTraining(BuildContext context) async {
    _indexCustomTraining++;
    if (_indexCustomTraining == _categoriesCount) {
      // TODO: implementar
    } else {
      _nthCustomExercises = await _physicalExercisesService.getCustomExercisesFromTraining(TrainingType.custom, _currentDifficulty ?? ExerciseDifficulty.easy, _indexCustomTraining);
      context.push(getCustomExerciseRoute(context));
    }
  }

  String getCustomExerciseRoute(BuildContext context) {
    var currentPath = RouterHelper.getUriFromContext(context);
    var currentPathSegments = currentPath.pathSegments;
    var cleanedPath =
      '/${currentPathSegments.sublist(0, currentPathSegments.length - 1).join('/')}';

    return '$cleanedPath/$_indexCustomTraining';
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
