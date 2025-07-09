import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorit_cubit.dart/add_to_favorite_state.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorite_repo/add_to_favorite_repo_imple.dart';

class AddToFavoritCubit extends Cubit<AddToFavoriteState> {
  AddToFavoritCubit(this.addToFavoriteRepoImple)
      : super(AddToFavoritInitialState());

  final AddToFavoriteRepoImple addToFavoriteRepoImple;

  static AddToFavoritCubit get(context) => BlocProvider.of(context);

  void addToFavorite(int productId) async {
    emit(AddToFavoritLoadingState());

    final result = await addToFavoriteRepoImple.addToFavorite(productId: productId);

    result.fold((error) {
      emit(AddToFavoritFailureState(error: error.message));
    }, (response) {

      emit(AddToFavoritSuccessState(responseModel: response));
    });
  }
}