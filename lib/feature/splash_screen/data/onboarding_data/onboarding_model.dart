import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;
   int? currentIndex;
   PageController? pageController;

  OnboardingModel(
      {required this.image,
       this.currentIndex,
       this.pageController,
      required this.title,
      required this.subTitle,
    });
}
