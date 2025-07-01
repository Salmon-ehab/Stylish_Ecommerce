import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_slider_repo/get_slider_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_sliders_cubit/get_slider_State.dart';

class GetSliderCubit extends Cubit<GetSliderState> {
  GetSliderCubit(this.getSliderRepoImple) : super(GetSliderInitState());
  final GetSliderRepoImple getSliderRepoImple;

   static GetSliderCubit get(context) => BlocProvider.of(context);

  getSliders() async {
    emit(GetSliderLoadingState());

    final result = await getSliderRepoImple.getSliders();

    result.fold((error) {
      emit(GetSliderErrorState(error: error.message));
    }, (sliders) {
      emit(GetSliderSuccessState(sliders: sliders));
    });
  }
}
