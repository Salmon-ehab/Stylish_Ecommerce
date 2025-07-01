import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_best_seller_repo/get_best_seller_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_best_seller_cubit/get_best_seller_state.dart';

class GetBestSellerCubit extends Cubit<GetBestSellerState> {
  final GetBestSellerRepoImple getBestSellerRepoImple;
  GetBestSellerCubit(this.getBestSellerRepoImple)
      : super(GetBestSellerInitState());
  getBestSellerProducts() async {
    emit(GetBestSellerLoadingState());

    final result = await getBestSellerRepoImple.getBestSeller();

    result.fold((error) {
      emit(GetBestSellerErrorState(error: error.message));
    }, (products) {
      emit(GetBestSellerSuccessState(products: products));
    });
  }
}
