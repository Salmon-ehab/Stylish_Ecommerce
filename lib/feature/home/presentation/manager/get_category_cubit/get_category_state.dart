import 'package:shop_ecommerce/feature/home/data/models/category_model.dart';

abstract class GetCategoryState {}

class GetCategoryInitState extends GetCategoryState {}

class GetCategorySuccessState extends GetCategoryState {
  final List<CategoryModel> categories;

  GetCategorySuccessState({required this.categories});
}

class GetCategoryLoadingState extends GetCategoryState {}

class GetCategoryErrorState extends GetCategoryState {
  String error;
  GetCategoryErrorState({required this.error});
}
