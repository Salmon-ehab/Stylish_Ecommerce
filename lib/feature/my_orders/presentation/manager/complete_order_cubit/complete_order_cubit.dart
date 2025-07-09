import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/complete_order_repo/complete_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/complete_order_cubit/complete_order_state.dart';

class CompleteOrderCubit extends Cubit<CompleteOrderState> {
  CompleteOrderCubit(this.completeOrderRepoImple)
      : super(CompleteOrderInitialState());

  final CompleteOrderRepoImple completeOrderRepoImple;
 static CompleteOrderCubit get(context) => BlocProvider.of(context);
  fetchOrderCompleted({required int orderId}) async {
    final result =
        await completeOrderRepoImple.getCompleteOrder(orderId: orderId);

    result.fold((error) {
      emit(CompleteOrderFailureState(error: error.message));
    }, (response) {
      emit(CompleteOrderSuccessState(responseModel: response));
    });
  }
}
