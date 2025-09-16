import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/on_bording_cubit.dart';
import 'package:stylish_demo/fetuers/onbordingpages/model/repo/data_sours.dart';
import 'package:stylish_demo/fetuers/signin_signup/pages/login_page.dart';

class CustomOnboardingBottom extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const CustomOnboardingBottom({
    super.key,
    required this.currentPage,
    this.totalPages = 3,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit, int>(
      builder: (context, state) {
        final controller = context.read<OnBordingCubit>();
        final bool isLastPage = state == onboardingPages.length - 1;

        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Prev button
              Visibility(
                visible: state != 0,
                replacement: const SizedBox(width: 60),
                child: TextButton(
                  onPressed: controller.prevPage,
                  child: const Text(
                    "Prev",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),

              // Page indicators
              Row(
                children: List.generate(onboardingPages.length, (index) {
                  final isActive = index == state;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 30 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF19202D)
                          : const Color.fromARGB(255, 161, 161, 161),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),

              // Next / Get Started button
              TextButton(
                onPressed: () {
                  if (isLastPage) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                        transitionDuration: const Duration(milliseconds: 600),
                      ),
                      (route) => false,
                    );
                  } else {
                    controller.nextPage();
                  }
                },
                child: Text(
                  state == onboardingPages.length - 1 ? "Get Started" : "Next",
                  style: const TextStyle(
                    color: Color(0xFFF83758),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
