import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_content.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  static OnboardingCubit get(context) => BlocProvider.of(context);
  PageController pageController = PageController();
  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(index);
  }

  void nextPage() {
    if (state < onboardingContent.length - 1) {
      goToPage(state + 1);
    }
  }

  void previousPage() {
    if (state > 0) {
      goToPage(state - 1);
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
