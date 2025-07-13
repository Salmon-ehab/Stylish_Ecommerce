import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item_details.dart';
import 'package:shop_ecommerce/feature/cart/data/models/cart_model.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/address_widget.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/delivery_address_widget.dart';
import 'package:shop_ecommerce/generated/l10n.dart';
import '../../../../../../core/models/shopping_model.dart';

class ShoppingListManagerWidget extends StatelessWidget {
  const ShoppingListManagerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      final List<CartItemModel> cartItems =
          state is CartUpdateState ? state.cartItems : [];
      return Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: DeliveryAddressWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(child: AddressWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: Text(S.of(context).shoppingList,
                  style:
                      Styles.text14W600.copyWith(color: AppColor.blackColor)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList.builder(
                itemBuilder: (context, index) {
                  final item = cartItems[index].productModel;
                  return CustomShoppingItem(
                      shoppingDetailsBody: CustomShoppingItemDetails(
                          shoppingModel: ShoppingModel(
                              itemName: item.name ?? "",
                              itemRating: item.rating ?? 0,
                              itemPrice: item.price ?? 0,
                              itemQuantity: cartItems[index].quantity)),
                      image: cartItems[index].productModel.imagePath!,
                      totalItemOrder: cartItems[index].totalPrice + 5);
                },
                itemCount: cartItems.length)
          ],
        ),
      );
    });
  }
}
