import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(const Locale("en")));
  static LanguageCubit get(context) => BlocProvider.of(context);

  getSavedLanguage() {
    final langCode = CacheHelper.getData(key: CacheKey.language);
    if (langCode != null) {
      emit(LanguageState(Locale(langCode)));
    }
  }
void toggleLanguage() {
  final newLang = state.locale.languageCode == 'en' ? 'ar' : 'en';
  CacheHelper.saveData(key: CacheKey.language, value: newLang);
  emit(LanguageState(Locale(newLang)));
}

  // changeLanguage(String langCode) {
  //   CacheHelper.saveData(key: CacheKey.language, value: langCode);
  //   emit(LanguageState(Locale(langCode)));
  // }
}
