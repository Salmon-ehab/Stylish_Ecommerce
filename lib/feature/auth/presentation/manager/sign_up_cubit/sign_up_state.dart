abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String error;
  SignUpFailureState({required this.error});
}

class SignUpSuccessState extends SignUpState {}
