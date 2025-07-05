import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/quantity_cubit/quantity_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_product_widget/custom_cart_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_widget.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_product_widget/custom_image_product.dart';

class TrendingProductBody extends StatelessWidget {
  const TrendingProductBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomImageProduct(productModel: productModel),
            const SizedBox(height: 36),
            Text(productModel.name ?? "", style: Styles.text20W600),
            const SizedBox(height: 18),
            Text(productModel.description ?? "",
                style: Styles.text14W400.copyWith(color: AppColor.blackColor)),
            const SizedBox(height: 32),
            BlocBuilder<QuantityCubit, int>(
                builder: (context, currentQuantity) {
              return CustomSalaryWidget(
                salary: productModel.price,
                quantity: currentQuantity,
                onIncrease: () => QuantityCubit.get(context)
                    .increment(),
                onDecrease: () => QuantityCubit.get(context)
                    .decrement(),
              );
            }),
            const SizedBox(height: 30),
            CustomCartButton(productModel: productModel),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
