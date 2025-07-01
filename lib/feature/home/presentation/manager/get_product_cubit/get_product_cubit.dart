import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_product_repo/get_product_repo.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_product_cubit/get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  final GetProductRepo getProductRepo;
  GetProductCubit(this.getProductRepo) : super(GetProductInitState());
 static GetProductCubit get(context)=> BlocProvider.of(context);

  List<ProductModel> _allProducts = [];

  Future<void> getProducts() async {
    emit(GetProductLoadingState());
    final result = await getProductRepo.getProducts();
    result.fold(
      (error) => emit(GetProductErrorState(error: error.message)),
      (products) {
        _allProducts = products;
        emit(GetProductSuccessState(products: products));
      },
    );
  }

  // في GetProductCubit.dart
void filterProductsByCategory(int categoryId) {
  final filtered = _allProducts.where((p) =>
    p.categoryModel != null && p.categoryModel!.id == categoryId
  ).toList();
  print(filtered);
  emit(GetProductSuccessState(products: filtered));
}
}
