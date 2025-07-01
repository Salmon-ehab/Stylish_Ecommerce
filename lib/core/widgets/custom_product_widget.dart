import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/rating_widget.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/trending_product_view.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyNavigator.goTo(
            screen: () => TrendingProductView(productModel: productModel));
      },
      child: Container(
        height: MyResponsive.height(context, 305),
        width: MyResponsive.width(context, 163),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 2),
              color: AppColor.blackColor.withOpacity(.15))
        ], color: AppColor.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                productModel.imagePath!,
                height: MyResponsive.height(context, 196),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.name!, style: Styles.text16W500),
                    Text(
                      productModel.description!,
                      style: Styles.text10W400
                          .copyWith(color: AppColor.blackColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("₹${productModel.price}",
                        style: Styles.text12W500
                            .copyWith(color: AppColor.blackColor)),
                    Row(
                      children: [
                        CustomRatingWidget(rating: productModel.rating!),
                        const SizedBox(width: 4),
                        Text(
                          "1,52,344",
                          style:
                              Styles.text10W400.copyWith(color: AppColor.grey7),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
