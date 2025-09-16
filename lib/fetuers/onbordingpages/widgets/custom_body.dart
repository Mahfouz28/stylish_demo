import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/on_bording_cubit.dart';
import 'package:stylish_demo/fetuers/onbordingpages/model/repo/data_sours.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBordingCubit>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<OnBordingCubit, int>(
        builder: (context, state) {
          return PageView.builder(
            onPageChanged: (i) => cubit.changePage(i),
            controller: cubit.pageController,
            itemCount: onboardingPages.length,
            itemBuilder: (context, index) {
              final model = onboardingPages[index];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image
                  Image.asset(model.imagePath, height: 250),
                  const SizedBox(height: 40),

                  // Title
                  Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Subtitle
                  Text(
                    model.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.71,
                      letterSpacing: 0.28,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
