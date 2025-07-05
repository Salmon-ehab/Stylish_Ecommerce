import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item.dart';
import 'package:shop_ecommerce/feature/cart/data/models/cart_model.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/cart_shop_item_body.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/custom_salary_cart.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(end: 21, start: 14, top: 10),
        child: Stack(
          children: [
            BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              final List<CartItemModel> cartItems =
                  state is CartUpdateState ? state.cartItems : [];

              if (cartItems.isEmpty) {
                return const Center(
                  child: Text(
                    "Your cart is empty!",
                    style: Styles.text18W600,
                  ),
                );
              }
              return CustomScrollView(slivers: [
                SliverPadding(
                  padding: const EdgeInsetsDirectional.only(start: 17),
                  sliver: SliverToBoxAdapter(
                    child: Text("Shopping List",
                        style: Styles.text14W600
                            .copyWith(color: AppColor.blackColor)),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverList.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 17, end: 10, bottom: 10),
                      child: CustomShoppingItem(
                          shoppingDetailsBody: CartShopItemBody(
                              cartItemModel: cartItems[index]),
                          image:
                              cartItems[index].productModel.imagePath ?? "",
                          totalItemOrder: cartItems[index].totalPrice),
                    );
                  },
                  itemCount: cartItems.length,
                ),
              ]);
            }),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:
                CustomSalaryCart(
                     
                    )
                  
                )
          ],
        ));
  }
}
