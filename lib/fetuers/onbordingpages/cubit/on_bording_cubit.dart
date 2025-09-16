import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish_demo/fetuers/onbordingpages/model/repo/data_sours.dart';

class OnBordingCubit extends Cubit<int> {
  OnBordingCubit() : super(0);
  final PageController pageController = PageController();
  void changePage(index) {
    emit(index);
  }

  void nextPage() {
    if (state < onboardingPages.length - 1) {
      emit(state + 1);
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void prevPage() {
    if (state > 0) {
      emit(state - 1);
      pageController.previousPage(
        duration: (Duration(milliseconds: 300)),
        curve: Curves.easeOutCirc,
      );
    }
  }

  void skip() {
    emit(onboardingPages.length - 1);
    pageController.animateToPage(
      onboardingPages.length - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }
}
