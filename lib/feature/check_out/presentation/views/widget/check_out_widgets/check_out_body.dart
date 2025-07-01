import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item_details.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/cart_view.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/address_widget.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/delivery_address_widget.dart';
import 'package:shop_ecommerce/core/widgets/shopping_list.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 22, end: 22, top: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
            padding: const EdgeInsets.only(bottom: 70),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: DeliveryAddressWidget()),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  const SliverToBoxAdapter(child: AddressWidget()),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: Text("Shopping List",
                        style: Styles.text14W600
                            .copyWith(color: AppColor.blackColor)),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  const ShoppingList(shoppingListBody: CustomShoppingItemDetails()),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomButton(label: "Place Order", onTap: () { 
                MyNavigator.goTo(screen: ()=> const CartView());
               },),
            ),
          ],
        ));
  }
}
