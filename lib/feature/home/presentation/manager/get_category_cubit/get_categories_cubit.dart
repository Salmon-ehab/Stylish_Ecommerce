import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/home/data/models/category_model.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_category_repo/get_category_repo.dart';

import 'get_category_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoryState> {
  final GetCategoryRepo getCategoryRepo;

  List<CategoryModel> _categories = [];
  CategoryModel? selectedCategory;

  GetCategoriesCubit(this.getCategoryRepo) : super(GetCategoryInitState());

  void getCategories() async {
    emit(GetCategoryLoadingState());
    final result = await getCategoryRepo.getCategories();
    result.fold(
      (failure) => emit(GetCategoryErrorState(error:failure.message)),
      (categories) {
        _categories = categories;
        selectedCategory = categories.isNotEmpty ? categories.first : null;
        emit(GetCategorySuccessState(categories: categories));
      },
    );
  }

  void selectCategory(CategoryModel category) {
    selectedCategory = category;
    emit(GetCategorySuccessState(categories: _categories)); 
  }
}
