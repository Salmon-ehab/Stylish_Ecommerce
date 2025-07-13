import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/delete_user_cubit/delete_user_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/delete_user_cubit/delete_user_state.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_state.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

import 'language_switch.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) async {
        if (state is DeleteUserErrorState) {
          AppSnackBar.showError(context: context, message: state.error);
        } else if (state is DeleteUserSuccessState) {
          await CacheHelper.saveData(key: CacheKey.accessToken, value: "");
          AppSnackBar.showSuccess(
              context: context, message: "User Deleted successfully");
          MyNavigator.goToOffAll(context, Routes.getStartView);
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
                Text(S.of(context).language, style: Styles.text18W500),
                BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, state) {
                    final cubit = LanguageCubit.get(context);
                    return LanguageSwitcher(
                      isEnglishSelected: state.locale.languageCode == 'en',
                      onToggle: () => cubit.toggleLanguage(),
                    );
                  },
                )
              ],
            ),
            const Spacer(),
            CustomButton(
                label: S.of(context).deleteAccount,
                onTap: DeleteUserCubit.get(context).deleteUserI)
          ],
        ),
      ),
    );
  }
}
