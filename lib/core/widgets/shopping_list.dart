import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key, required this.shoppingListBody});
   final Widget shoppingListBody;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return  CustomShoppingItem(
              shoppingDetailsBody: shoppingListBody);
        },
        childCount: 6,
      ),
    );
  }
}
