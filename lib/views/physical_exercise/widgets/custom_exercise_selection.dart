import 'package:artriapp/utils/index.dart';
import 'package:artriapp/views/physical_exercise/widgets/index.dart';
import 'package:artriapp/views/widgets/index.dart';
import 'package:artriapp/view_models/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CustomExerciseSelection extends StatefulWidget {
  const CustomExerciseSelection({super.key});

  @override
  State<CustomExerciseSelection> createState() =>
      _CustomExerciseSelectionState();
}

class _CustomExerciseSelectionState
    extends State<CustomExerciseSelection> {
  void handleNextButton(
      BuildContext context,
      PhysicalExercisesViewModel viewModel,
      int trainingId,
  ) {
    viewModel.handleUpdateIndexCustomTraining(context, trainingId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhysicalExercisesViewModel>(
      builder: (context, viewModel, child) {
        final trainingId = viewModel.getTrainingId(context);
        final exercises = viewModel.getExercisesForIndex(trainingId);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              // TODO: Ajustar
              'Selecione X exercícios das opções abaixo:',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGreen,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Scrollbar(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: ExerciseTile(
                            exerciseName: exercise.name,
                            customIcon: CupertinoIcons.play_arrow_solid,
                          ),
                        ),
                        Checkbox(
                          value: viewModel.customExercisesIds.contains(exercise.id),
                          onChanged: (value) {
                            viewModel.toggleCustomExerciseSelection(exercise.id);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            CustomSolidButton(
              text: 'Próximo'.toUpperCase(),
              onPressed: () => handleNextButton(context, viewModel, trainingId),
              gradientColors: AppGradients.greenGradient,
              textStyle: GoogleFonts.montserrat(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
