import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/home/data/models/slider_model.dart';

class CarouselBody extends StatelessWidget {
  const CarouselBody(
      {super.key, required this.sliderModel});
  final SliderModel sliderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(sliderModel.imagePath ?? ""),
          fit: BoxFit.fill,
          alignment: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sliderModel.title ?? "No Data", style: Styles.text20W700),
          const SizedBox(height: 8),
          SizedBox(
            width: 180,
            child: Text(
              sliderModel.description ?? "No Data",
              style: Styles.text12W400.copyWith(color: AppColor.white),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 32,
            width: 100,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: AppColor.white, width: 1.0),
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Shop Now',
                    style: Styles.text12W600.copyWith(color: AppColor.white),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward,
                      size: 14, color: AppColor.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
