import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/item_model.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/order_entity.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget(
      {super.key,
      required this.orderStatusWidget,
      required this.item,
      required this.date,
      required this.orderEntity});
  final Widget orderStatusWidget;
  final Item item;
  final OrderEntity orderEntity;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: () {
          MyNavigator.goTo(context, Routes.orderDetailsView,
              extra: orderEntity);
        },
        child: Container(
          height: MyResponsive.height(context, 106),
          width: double.infinity,
          margin: const EdgeInsetsDirectional.only(start: 19, end: 19, top: 19),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: AppColor.blackColor.withOpacity(.25))
              ]),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  item.imagePath ?? "",
                  height: MyResponsive.height(context, 106),
                  width: MyResponsive.width(context, 103),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                  child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 12, end: 15, bottom: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(item.name ?? "",
                              style: Styles.text16W500,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 5),
                        Text("₹ ${orderEntity.total}",
                            style: Styles.text12W500
                                .copyWith(color: AppColor.blackColor)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(date,
                            style: Styles.text10W400
                                .copyWith(color: AppColor.blackColor)),
                        Text("${item.quantity} item",
                            style: Styles.text10W400
                                .copyWith(color: AppColor.blackColor)),
                      ],
                    ),
                    orderStatusWidget
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
