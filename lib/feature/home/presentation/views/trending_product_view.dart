import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_product_widget/trending_product_body.dart';

class TrendingProductView extends StatelessWidget {
  const TrendingProductView({super.key, required this.productModel});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const CustomAppbar(title: "Product",),
      body:TrendingProductBody(productModel: productModel,),
    );
  }
}