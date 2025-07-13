import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_demo/app/ui/screens/page/onbordingpages/cubit/on_bording_cubit.dart';

class CustomHeaderOnBoarding extends StatelessWidget {
  final int totalSteps;

  const CustomHeaderOnBoarding({super.key, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Page Indicator
            Text(
              '${state + 1}/$totalSteps',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),

            // Skip Button
            TextButton(
              onPressed: () {
                context.read<OnBordingCubit>().skip();
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
