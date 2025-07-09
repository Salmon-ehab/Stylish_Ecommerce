import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/get_order_repo/get_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_state.dart';

class GetOrderCubit extends Cubit<GetOrderState> {
  GetOrderCubit(this.getOrderRepoImple) : super(GetOrderInitialState());
  final GetOrderRepoImple getOrderRepoImple;
static GetOrderCubit get(context) => BlocProvider.of(context);
  fetchOrders() async {
    emit(GetOrderLoadingState());
    final result = await getOrderRepoImple.getOrders();

    result.fold((error) {
      emit(GetOrderFailureState(error: error.message));
    }, (orderList) {
      emit(GetOrderSuccessState(orderModel: orderList));
    });
  }
}
