import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';

class CarouselDots extends StatelessWidget {
  const CarouselDots(
      {super.key,
      required this.currentIndex,
      required this.carouselSliderController, required this.generateDots});
  final int currentIndex;
  final CarouselSliderController carouselSliderController;
  final List generateDots;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: generateDots.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => carouselSliderController.animateToPage(entry.key),
          child: Container(
            width: 9,
            height: 9,
            margin: const EdgeInsets.symmetric(horizontal:2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == entry.key
                  ? AppColor.pinkColor
                  : AppColor.grey6,
            ),
          ),
        );
      }).toList(),
    );
  }
}
