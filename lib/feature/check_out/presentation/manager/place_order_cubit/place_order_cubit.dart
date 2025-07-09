import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/check_out/data/repo/place_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/manager/place_order_cubit/place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.placeOrderRepoImple, this.cartCubit)
      : super(PlaceOrderInitialState());
  final PlaceOrderRepoImple placeOrderRepoImple;
  final CartCubit cartCubit;

  static PlaceOrderCubit get(context) => BlocProvider.of(context);

  placeOrder() async {
    emit(PlaceOrderLoadingState());
    final result = await placeOrderRepoImple.placeOrder();
 
    result.fold((error) {
      emit(PlaceOrderErrorState(error: error.toString()));
    }, (response) {
      cartCubit.clearCart();
      emit(PlaceOrderSuccessState(placeOrderResponseModel: response));
    });
  }
}
