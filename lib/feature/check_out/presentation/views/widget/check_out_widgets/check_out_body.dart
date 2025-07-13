import 'package:flutter/material.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/place_order_manager_widget.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/shopping_list_manager_widget.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsetsDirectional.only(start: 22, end: 22, top: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [ShoppingListManagerWidget(), PlaceOrderManagerWidget()],
        ));
  }
}
