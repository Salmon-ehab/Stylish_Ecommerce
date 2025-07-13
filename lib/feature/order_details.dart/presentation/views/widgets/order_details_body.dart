import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/models/shopping_model.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item.dart';
import 'package:shop_ecommerce/core/widgets/custom_shopping_item_details.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/order_entity.dart';
import 'package:shop_ecommerce/feature/order_details.dart/presentation/views/widgets/order_details_salary.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key, required this.orderEntity});
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    late String orderStatus;
    if (orderEntity.status == 0) {
      orderStatus = S.current.active;
    } else if (orderEntity.status == 1) {
      orderStatus = S.current.completed;
    } else if (orderEntity.status == 2) {
      orderStatus = S.current.canceled;
    }

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${S.of(context).orderNo}.${orderEntity.id}",
                              style: Styles.text20W500),
                          Text(
                            "${orderEntity.orderDate}",
                            style: Styles.text14W300,
                          )
                        ],
                      ),
                      const SizedBox(width: 3),
                      Text(orderStatus,
                          style: Styles.text20W500
                              .copyWith(color: AppColor.appNameColor)),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverList.builder(
                    itemBuilder: (context, index) {
                      final order = orderEntity.items[index];
                      return CustomShoppingItem(
                          shoppingDetailsBody: CustomShoppingItemDetails(
                              shoppingModel: ShoppingModel(
                                  itemName: order.name ?? "",
                                  itemRating: order.rating ?? 0,
                                  itemPrice: order.price ?? 0,
                                  itemQuantity: order.quantity ?? 0)),
                          image: orderEntity.items[index].imagePath ?? "",
                          totalItemOrder: order.totalPrice??0);
                    },
                    itemCount: orderEntity.items.length),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: OrderDetailsSalary(totalSalary: orderEntity.total ?? 0))
          ],
        ));
  }
}
