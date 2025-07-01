import 'package:shop_ecommerce/feature/auth/data/models/user_response_api.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInFailureState extends SignInState {
  final String error;
  SignInFailureState({required this.error});
}

class SignInSuccessState extends SignInState {
  final UserResponseApi userResponseApi;

  SignInSuccessState({required this.userResponseApi});
}
