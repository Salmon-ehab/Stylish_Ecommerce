import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/png.dart';

class CustomImageItem extends StatelessWidget {
  const CustomImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    PngAssets.shopItemImage,
                    height: MyResponsive.height(context, 125),
                    width: MyResponsive.width(context, 130),
                    fit: BoxFit.cover,
                  ));
  }
}