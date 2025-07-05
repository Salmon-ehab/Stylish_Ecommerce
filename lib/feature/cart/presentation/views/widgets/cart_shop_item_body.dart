import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_widget.dart';
import 'package:shop_ecommerce/feature/cart/data/models/cart_model.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';

class CartShopItemBody extends StatelessWidget {
  const CartShopItemBody({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${cartItemModel.productModel.name}",
                style: Styles.text14W600.copyWith(color: AppColor.blackColor)),
            Row(
              children: [
                Text("${cartItemModel.productModel.rating}",
                    style:
                        Styles.text12W500.copyWith(color: AppColor.blackColor)),
                const SizedBox(width: 5),
                SvgPicture.asset(
                  SvgAssets.starIcon,
                  height: 11,
                  width: 11,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("\$ ${cartItemModel.productModel.price}",
                    style:
                        Styles.text16W600.copyWith(color: AppColor.blackColor)),
                const SizedBox(width: 5),
                Text("\$ 64.00",
                    style: Styles.text12W500.copyWith(
                      color: AppColor.grey9,
                      decoration: TextDecoration.lineThrough,
                    )),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                CustomSalaryWidget(
                  isNeeded: false,
                  quantity: cartItemModel.quantity,
                  onIncrease: () {
                    CartCubit.get(context)
                        .increaseQuantity(cartItemModel.productModel.id!);
                  },
                  onDecrease: () {
                    CartCubit.get(context)
                        .decreaseQuantity(cartItemModel.productModel.id!);
                  }, salary: cartItemModel.productModel.price??0,
                )
              ],
            )
          ],
        ));
  }
}
