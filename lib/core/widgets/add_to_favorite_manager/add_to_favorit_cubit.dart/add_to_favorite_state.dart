import 'package:shop_ecommerce/core/models/response_model.dart';

abstract class AddToFavoriteState {}

class AddToFavoritInitialState extends AddToFavoriteState {}

class AddToFavoritLoadingState extends AddToFavoriteState {}

class AddToFavoritFailureState extends AddToFavoriteState {
  final String error;
 AddToFavoritFailureState({required this.error});
}

class AddToFavoritSuccessState extends AddToFavoriteState {
  final ResponseModel? responseModel;

  AddToFavoritSuccessState({required this.responseModel});
}
