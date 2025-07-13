import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/quantity_cubit/quantity_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_product_widget/trending_product_body.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class TrendingProductView extends StatelessWidget {
  const TrendingProductView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuantityCubit()),
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          title: S.of(context).product,
        ),
        body: TrendingProductBody(
          productModel: productModel,
        ),
      ),
    );
  }
}
