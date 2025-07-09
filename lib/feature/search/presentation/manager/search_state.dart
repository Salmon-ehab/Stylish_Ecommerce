import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<ProductModel> products;

  SearchSuccessState({required this.products});
}

class SearchFailureState extends SearchState {
  final String error;

  SearchFailureState({required this.error});
}
