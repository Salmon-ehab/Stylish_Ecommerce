import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_data.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/feature/auth/data/repo/sign_in_repo/sign_in_repo_imple.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepoImple) : super(SignInInitialState());
  final SignInRepoImple signInRepoImple;
  static SignInCubit get(context) => BlocProvider.of(context);
  String? error;
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onLoginPressed() async {
    error = null;
    if (!key.currentState!.validate()) {
      error = 'Complete the form and fix errors';
      emit(SignInFailureState(error: error!));
      return;
    }

    emit(SignInLoadingState());

    final result = await signInRepoImple.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold((error) {
      emit(SignInFailureState(error: error.message));
    }, (userResponse) {
       CacheHelper.saveData(
          key: CacheKey.accessToken, value: userResponse.accessToken);
      CacheHelper.saveData(
          key: CacheKey.refreshToken, value: userResponse.refreshToken);
      CacheData.accessToken = userResponse.accessToken;
      CacheData.refreshToken = userResponse.refreshToken;
      emit(SignInSuccessState(userResponseApi: userResponse));
    });
  }
}
