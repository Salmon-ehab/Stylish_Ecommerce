import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/settings/data/delete_user_repo/delete_user_repo_imple.dart';
import 'package:shop_ecommerce/feature/settings/presentation/delete_user_cubit/delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState>{
  DeleteUserCubit(this.deleteUserRepoImple):super(DeleteUserInitState());
    final DeleteUserRepoImple deleteUserRepoImple;
  static DeleteUserCubit get(context) => BlocProvider.of(context);


   deleteUserI() async {
    var response = await deleteUserRepoImple.deleteUser();
    response.fold((error) {
      emit(DeleteUserErrorState(error: error.toString()));
    }, (userModel) {
      emit(DeleteUserSuccessState());
    });
  }
}