import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/on_bording_cubit.dart';
import 'package:stylish_demo/fetuers/onbordingpages/widgets/custom_body.dart';
import 'package:stylish_demo/fetuers/onbordingpages/widgets/custom_header_on_boarding.dart';
import 'package:stylish_demo/fetuers/onbordingpages/widgets/custom_onboarding_Bottom.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBordingCubit(),

      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                // Header with page indicator and skip
                const CustomHeaderOnBoarding(totalSteps: 3),

                // Page content
                const Expanded(child: OnBoardingBody()),

                // Bottom navigation
                BlocBuilder<OnBordingCubit, int>(
                  builder: (context, state) {
                    return CustomOnboardingBottom(currentPage: state);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
