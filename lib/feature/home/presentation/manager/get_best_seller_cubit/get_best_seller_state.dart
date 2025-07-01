import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

abstract class GetBestSellerState {}

class GetBestSellerInitState extends GetBestSellerState {}

class GetBestSellerSuccessState extends GetBestSellerState {
  final List<ProductModel> products;

  GetBestSellerSuccessState({required this.products});
}

class GetBestSellerLoadingState extends GetBestSellerState {}

class GetBestSellerErrorState extends GetBestSellerState {
  String error;
  GetBestSellerErrorState({required this.error});
}
