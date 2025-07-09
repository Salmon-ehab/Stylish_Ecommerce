import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/cancel_order_repo/cancel_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/cancel_order_cubit/cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  CancelOrderCubit(this.cancelOrderRepoImple)
      : super(CancelOrderInitialState());
  final CancelOrderRepoImple cancelOrderRepoImple;
  static CancelOrderCubit get(context) => BlocProvider.of(context);
  cancelOrder({required int orderId}) async {
    emit(CancelOrderLoadingState());
    final result = await cancelOrderRepoImple.cancelOrder(orderId: orderId);

    result.fold(
      (failure) {
        emit(CancelOrderFailureState(error: failure.message));
      },
      (responseModel) {
        emit(CancelOrderSuccessState(responseModel: responseModel));
      },
    );
  }
}
