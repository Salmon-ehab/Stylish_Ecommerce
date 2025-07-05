import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(const Locale("en")));

  Future<void> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('lang') ?? "en";
    emit(LanguageState(Locale(langCode)));
  }

  Future<void> changeLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', langCode);
    emit(LanguageState(Locale(langCode)));
  }
}
