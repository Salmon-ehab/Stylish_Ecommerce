import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/shopping_list.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_container.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/cart_shop_item_body.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(end: 21, start: 14, top: 10),
        child: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverPadding(
                padding: const EdgeInsetsDirectional.only(start: 17),
                sliver: SliverToBoxAdapter(
                  child: Text("Shopping List",
                      style: Styles.text14W600
                          .copyWith(color: AppColor.blackColor)),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              const SliverPadding(
                padding: EdgeInsetsDirectional.only(start: 17, end: 10),
                sliver: ShoppingList(shoppingListBody: CartShopItemBody()),
              ),
            ]),
            const Positioned(
                bottom: 0, left: 0, right: 0, child: CustomSalaryContainer())
          ],
        ));
  }
}
