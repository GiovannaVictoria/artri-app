import 'package:artriapp/utils/index.dart';
import 'package:artriapp/views/physical_exercise/widgets/index.dart';
import 'package:artriapp/views/widgets/index.dart';
import 'package:artriapp/view_models/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CustomExerciseRoutineOverview extends StatefulWidget {
  const CustomExerciseRoutineOverview({super.key});

  @override
  State<CustomExerciseRoutineOverview> createState() =>
      _CustomExerciseRoutineOverviewState();
}

class _CustomExerciseRoutineOverviewState
    extends State<CustomExerciseRoutineOverview> {
  bool orientationsOpen = false;

  // TODO: Implementar
  void handleStartButton(
      BuildContext context,
      PhysicalExercisesViewModel viewModel,
  ) {}

  @override
  Widget build(BuildContext context) {
    return Consumer<PhysicalExercisesViewModel>(
      builder: (context, viewModel, child) {
        int categoriesCount = CustomType.values.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              'Vamos começar a montar sua rotina de exercícios personalizada de hoje! Clique para escolher os exercícios indicados abaixo:',
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
                  itemCount: categoriesCount,
                  itemBuilder: (context, index) => ExerciseTile(
                    // TODO: substituir X pelos valores numéricos
                    exerciseName: 'Escolha X exercícios da categoria "${CustomType.values.elementAt(index).toString()}"',
                    customIcon: CupertinoIcons.create,
                  ),
                ),
              ),
            ),
            CustomSolidButton(
              text: 'Começar'.toUpperCase(),
              onPressed: () => handleStartButton(context, viewModel),
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
