import 'package:shop_ecommerce/feature/auth/data/models/user_model_from_api.dart';

abstract class UserState {}

class UserInitState extends UserState {}
class UserLoadingState extends UserState {}


class UserSuccessState extends UserState {
  UserModelFromApi userModel;

  UserSuccessState({required this.userModel});
}
class UserErrorState extends UserState {
  String error;
  UserErrorState({required this.error});
}
