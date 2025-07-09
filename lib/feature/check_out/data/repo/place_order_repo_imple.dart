import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/cart/data/models/cart_model.dart';
import 'package:shop_ecommerce/feature/check_out/data/model/place_order_response_model.dart';
import 'package:shop_ecommerce/feature/check_out/data/repo/place_order_repo.dart';

class PlaceOrderRepoImple implements PlaceOrderRepo {
  final ApiConsumer apiConsumer;
  final List<CartItemModel> cartItemsOrder;

  PlaceOrderRepoImple({required this.cartItemsOrder, required this.apiConsumer});
  @override
  Future<Either<Failure, PlaceOrderResponseModel>> placeOrder() async {
    final List<Map<String, dynamic>> itemsListForApi =
        cartItemsOrder.map((cartItem) {
      return {
        'product_id': cartItem.productModel.id,
        'quantity': cartItem.quantity
      };
    }).toList();
    Map<String, dynamic> requestBody = {'items': itemsListForApi};

    try {
      final response = await apiConsumer.post(EndPoints.placeOrder,
          isFormData: false, data: requestBody,isProtected: true);
      PlaceOrderResponseModel placeOrderResponseModel =
          PlaceOrderResponseModel.fromJson(response);

      return right(placeOrderResponseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      print("saaaaaaaaaaaaaal");
      return Left(Failure("try again!"));
    }
  }
}
