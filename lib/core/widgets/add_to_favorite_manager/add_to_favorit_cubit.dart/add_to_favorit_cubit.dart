import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorit_cubit.dart/add_to_favorite_state.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorite_repo/add_to_favorite_repo_imple.dart';

class AddToFavoritCubit extends Cubit<AddToFavoriteState> {
  AddToFavoritCubit(this.addToFavoriteRepoImple)
      : super(AddToFavoritInitialState());

  final AddToFavoriteRepoImple addToFavoriteRepoImple;

  static AddToFavoritCubit get(context) => BlocProvider.of(context);

  // هذه الدالة وظيفتها فقط إرسال طلب الإضافة للمفضلة للـ API
  // لن يكون هناك أي منطق محلي هنا لتتبع المفضلة
  void addToFavorite(int productId) async {
    emit(AddToFavoritLoadingState());

    final result = await addToFavoriteRepoImple.addToFavorite(productId: productId);

    result.fold((error) {
      emit(AddToFavoritFailureState(error: error.message));
    }, (response) {
      // فقط قم بإصدار حالة النجاح
      // تحديث واجهة المستخدم سيتم عن طريق إعادة جلب بيانات المستخدم من AuthCubit
      emit(AddToFavoritSuccessState(responseModel: response));
    });
  }
}