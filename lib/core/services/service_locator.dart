import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/get_data_repo/get_data_imple.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/search/data/repo/search_repo_imple.dart';
import 'package:shop_ecommerce/feature/search/presentation/manager/search_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));

  getIt.registerLazySingleton<UserCubit>(
      () => UserCubit(GetDataRepoImple(getIt<DioConsumer>())));

      getIt.registerLazySingleton<SearchCubit>(
      () =>SearchCubit(SearchRepoImple(apiConsumer: getIt<DioConsumer>())));
}
