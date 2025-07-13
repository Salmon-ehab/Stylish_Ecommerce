import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/quantity_cubit/quantity_cubit.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class CustomCartButton extends StatelessWidget {
  final ProductModel productModel;
  const CustomCartButton({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final quantity = QuantityCubit.get(context).state;
        CartCubit.get(context).addToCart(productModel, quantity: quantity);
        AppSnackBar.showSuccess(
            context: context,
            message:
                '${quantity}x ${productModel.name ?? 'Item'} added to cart!');
        MyNavigator.goTo(context, Routes.cartView);
      },
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.appNameColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgAssets.shoppingNavIcon,
              color: AppColor.white,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 14),
            Text(
              S.of(context).addtoCart,
              style: Styles.text15W600,
            ),
          ],
        ),
      ),
    );
  }
}
