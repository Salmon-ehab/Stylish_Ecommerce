import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/delete_user_cubit/delete_user_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/delete_user_cubit/delete_user_state.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_state.dart';

import 'language_switch.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) async {
        if (state is DeleteUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is DeleteUserSuccessState) {
          await CacheHelper.saveData(key: CacheKey.accessToken, value: "");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Deleted successfully")),
          );
          MyNavigator.goToOff(
              screen: const GetStartView(), isReplaceOffAll: true);
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 27, end: 33, top: 50, bottom: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Language", style: Styles.text18W500),
                BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, state) {
                    final cubit = LanguageCubit.get(context);
                  print("lang:${state.locale.languageCode}");
                    return LanguageSwitcher(
                      isEnglishSelected: state.locale.languageCode == 'en',
                      onToggle: () => cubit.toggleLanguage(),
                    );
                  },
                )

                // BlocBuilder<LanguageCubit, LanguageState>(
                //     builder: (context, state) {
                //   final isEnglish = state.locale.languageCode == 'en';
                //   print("salmaaaaa:$isEnglish");
                //   print("salmaaaaa:${state.locale.languageCode}");

                //   return LanguageSwitcher(
                //     isEnglishSelected: isEnglish,
                //     onToggle: () {
                //       final newLang = isEnglish ? 'ar' : 'en';
                //       LanguageCubit.get(context).changeLanguage(newLang);
                //     },
                //   );
                // }),
              ],
            ),
            const Spacer(),
            CustomButton(
                label: "Delete Account",
                onTap: DeleteUserCubit.get(context).deleteUserI)
          ],
        ),
      ),
    );
  }
}
