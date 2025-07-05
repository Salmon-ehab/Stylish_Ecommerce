
abstract class DeleteUserState {}

class DeleteUserInitState extends DeleteUserState {}

class DeleteUserSuccessState extends DeleteUserState {

  DeleteUserSuccessState();
}

class DeleteUserErrorState extends DeleteUserState {
  String error;
  DeleteUserErrorState({required this.error});
}
