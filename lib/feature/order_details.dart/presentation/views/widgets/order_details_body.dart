import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/shopping_list.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_container.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/cart_shop_item_body.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 22, end: 21, top: 15),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order No. 005", style: Styles.text20W500),
                          Text(
                            "29 Nov, 01:20 pm ",
                            style: Styles.text14W300,
                          )
                        ],
                      ),
                      Text("Active",
                          style: Styles.text20W500
                              .copyWith(color: AppColor.appNameColor)),
                    ],
                  ),
                ),
               const SliverToBoxAdapter(
                  child: SizedBox(height: 20)
                ),
                const ShoppingList(shoppingListBody: CartShopItemBody()),
                
              ],
            ),
            const Positioned(
                bottom: 0, left: 0, right: 0, child: CustomSalaryContainer(isNeeded: false,))
          ],
        ));
  }
}
