import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_model_to_api.dart';
import 'package:shop_ecommerce/feature/auth/data/repo/sign_up_repo/sign_up_imple.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpImple) : super(SignUpInitialState());
  final SignUpImple signUpImple;
  static SignUpCubit get(context) => BlocProvider.of(context);
  String? error;
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  onPressedRegisterButton() async {
    if (!key.currentState!.validate()) {
      error = "Please complete all fields.";
      emit(SignUpFailureState(error: error!));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      error = "Passwords must be identical.";
      emit(SignUpFailureState(error: error!));
      return;
    }
    emit(SignUpLoadingState());

    final result = await signUpImple.signUpWithEmailAndPassword(
        userModel: UserModelToApi(null,
            name: nameController.text,
            phone: phoneController.text,
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text));

    result.fold((error) {
      emit(SignUpFailureState(error: error.message));
    }, (response) {
      emit(SignUpSuccessState());
    });
  }
}
