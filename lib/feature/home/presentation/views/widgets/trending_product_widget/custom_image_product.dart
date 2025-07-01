import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/widget/heart_icon_widget.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

class CustomImageProduct extends StatelessWidget {
  const CustomImageProduct({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: MyResponsive.height(context, 308),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:  DecorationImage(
                    image: NetworkImage(
                     productModel.imagePath??"",
                    ),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 16, end: 12),
            child: HeartIconWidget(
             productModel: productModel,
            ),
          )
        ],
      ),
    );
  }
}
