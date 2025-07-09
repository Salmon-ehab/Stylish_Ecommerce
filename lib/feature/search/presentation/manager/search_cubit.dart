import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/search/data/repo/search_repo_imple.dart';
import 'package:shop_ecommerce/feature/search/presentation/manager/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImple) : super(SearchInitialState());
  final SearchRepoImple searchRepoImple;

  TextEditingController textEditingController = TextEditingController();

  static SearchCubit get(context) => BlocProvider.of(context);

  getSearchItems({required String quiery}) async {
    emit(SearchLoadingState());
    final result = await searchRepoImple.searchItems(quiery: quiery);

    result.fold((error) {
      emit(SearchFailureState(error: error.message));
    }, (products) {
      emit(SearchSuccessState(products: products));
    });
  }
  clearTextEditingController(){
    textEditingController.clear();
    emit(SearchInitialState());
  }
}
