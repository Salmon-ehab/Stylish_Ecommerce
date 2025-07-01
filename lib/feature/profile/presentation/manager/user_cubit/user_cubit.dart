import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_model_from_api.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/get_data_repo/get_data_imple.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.getDataImple) : super(UserInitState());
  final GetDataRepoImple getDataImple;
  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModelFromApi user}) {
    emit(UserSuccessState(userModel: user));
  }

   getUserDataFromAPI() async {
    var response = await getDataImple.getData();
    response.fold((error) {
      emit(UserErrorState(error: error.toString()));
    }, (userModel) {
      emit(UserSuccessState(userModel: userModel));
    });
  }
}
