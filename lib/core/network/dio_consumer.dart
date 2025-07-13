import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/cache/cache_data.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/go_route/app_router.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;

  bool isRefreshingToken = false;
  bool isNavigatedToLogin = false;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("--- Headers : ${options.headers}");
        print("--- endpoint : ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("--- Response : ${response.data}");
        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        print("--- Error : ${error.response?.data}");

        final isTokenExpired = error.response?.data['message']?.toString().contains('expired') == true ||
            error.response?.statusCode == 401 ||
            error.response?.statusCode == 403;

        if (isTokenExpired) {
          // ✅ لو فيه عملية refresh شغالة، استنى
          if (isRefreshingToken) {
            await Future.delayed(const Duration(milliseconds: 500));
            try {
              final retryResponse = await dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            } catch (_) {
              return handler.next(error);
            }
          }

          isRefreshingToken = true;

          try {
            final res = await post(EndPoints.refreshToken,
                sendRefreshToken: true, isProtected: true);

            if (res == null || res is! Map<String, dynamic> || res['access_token'] == null) {
              throw Exception("Invalid refresh token response");
            }

            CacheData.accessToken = res['access_token'];
            await CacheHelper.saveData(
                key: CacheKey.accessToken, value: CacheData.accessToken);

            print("🟢 Token refreshed: ${CacheData.accessToken}");

            final options = error.requestOptions;

            if (options.data is FormData) {
              final oldFormData = options.data as FormData;

              final Map<String, dynamic> formMap = {};
              for (var entry in oldFormData.fields) {
                formMap[entry.key] = entry.value;
              }
              for (var file in oldFormData.files) {
                formMap[file.key] = file.value;
              }

              options.data = FormData.fromMap(formMap);
            }

            options.headers['Authorization'] = 'Bearer ${CacheData.accessToken}';
            final response = await dio.fetch(options);

            isRefreshingToken = false;
            return handler.resolve(response);
          } catch (e) {
            isRefreshingToken = false;

            if (!isNavigatedToLogin) {
              isNavigatedToLogin = true;

              await CacheHelper.removeData(key: CacheKey.accessToken);
              await CacheHelper.removeData(key: CacheKey.refreshToken);

              if (navigatorKey.currentContext != null) {
                MyNavigator.goToOffAll(navigatorKey.currentContext!, Routes.signInView);
              }
            }

            return handler.next(error);
          }
        }

        return handler.next(error);
      },
    ));
  }

  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.delete(path,
          data: data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.get(path,
          data: data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFormData && data is! FormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData && data is! FormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.put(path,
          data: isFormData && data is! FormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  void handleDioExceptions(DioException e) {
    try {
      print("❗ DioException caught:");
      print("➡ Message: ${e.message}");
      print("➡ Status code: ${e.response?.statusCode}");

      dynamic data = e.response?.data;
      String serverMessage = 'Unknown error occurred';

      if (data is Map<String, dynamic>) {
        serverMessage = data['message'] ?? serverMessage;
      } else if (data is String) {
        print("❗ Response is HTML or raw string:\n$data");
        serverMessage = 'Internal server error or unexpected response format.';
      } else if (data == null) {
        serverMessage = 'No response from server.';
      }

      print("➡ Parsed message: $serverMessage");

      final error = AppException.fromDio(e);
      throw error;
    } catch (err, stack) {
      print("🔥 Exception while handling DioException: $err");
      print("📌 StackTrace: $stack");
      rethrow;
    }
  }
}


// class DioConsumer extends ApiConsumer {
//   final Dio dio;

//   DioConsumer({required this.dio}) {
//     dio.options.baseUrl = EndPoints.baseUrl;
//     dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       print("--- Headers : ${options.headers.toString()}");
//       print("--- endpoint : ${options.path.toString()}");
//       return handler.next(options);
//     }, onResponse: (response, handler) {
//       print("--- Response : ${response.data.toString()}");
//       return handler.next(response);
//     }, onError: (DioException error, handler) async {
//       print("--- Error : ${error.response?.data.toString()}");
//       if (error.response?.data['message'].contains('expired')) {
//         // refresh token
//         try {
//           var res = await post(EndPoints.refreshToken,
//               sendRefreshToken: true, isProtected: true);

//           // must update token
//           CacheData.accessToken = res['access_token'];
//           await CacheHelper.saveData(
//               key: CacheKey.accessToken, value: CacheData.accessToken);

//           // Retry original request
//           final options = error.requestOptions;
//           if (options.data is FormData) {
//             final oldFormData = options.data as FormData;

//             // Convert FormData to map so it can be rebuilt
//             final Map<String, dynamic> formMap = {};
//             for (var entry in oldFormData.fields) {
//               formMap[entry.key] = entry.value;
//             }

//             // Add files if any
//             for (var file in oldFormData.files) {
//               formMap[file.key] = file.value;
//             }

//             // Rebuild new FormData
//             options.data = FormData.fromMap(formMap);
//           }
//           options.headers['Authorization'] = 'Bearer ${CacheData.accessToken}';
//           final response = await dio.fetch(options);
//           return handler.resolve(response);
//         } catch (e) {
//           CacheHelper.removeData(key: CacheKey.accessToken);
//           CacheHelper.removeData(key: CacheKey.refreshToken);
//           MyNavigator.goToOff(navigatorKey.currentContext!,Routes.signInView);
//           return handler.next(error);
//         }
//       }

//       return handler.next(error);
//     }));
//   }

//   @override
//   Future delete(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameter,
//       bool isFormData = true,
//       bool isProtected = false,
//       bool sendRefreshToken = false}) async {
//     try {
//       final response = await dio.delete(path,
//           data: data,
//           queryParameters: queryParameter,
//           options: Options(headers: {
//             if (isProtected)
//               'Authorization':
//                   'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
//           }));
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }

//   @override
//   Future get(String path,
//       {Object? data,
//       Map<String, dynamic>? queryParameter,
//       bool isProtected = false,
//       bool sendRefreshToken = false}) async {
//     try {
//       final response = await dio.get(path,
//           data: data,
//           queryParameters: queryParameter,
//           options: Options(headers: {
//             if (isProtected)
//               'Authorization':
//                   'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
//           }));
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }

//   @override
//   Future patch(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameter,
//       bool isFormData = true,
//       bool isProtected = false,
//       bool sendRefreshToken = false}) async {
//     try {
//       final response = await dio.patch(path,
//           data: isFormData && data is! FormData
//               ? FormData.fromMap(data as Map<String, dynamic>)
//               : data,
//           queryParameters: queryParameter,
//           options: Options(headers: {
//             if (isProtected)
//               'Authorization':
//                   'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
//           }));
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }

//   @override
//   Future post(String path,
//       {Object? data,
//       Map<String, dynamic>? queryParameter,
//       bool isFormData = true,
//       bool isProtected = false,
//       bool sendRefreshToken = false}) async {
//     try {
//       final response = await dio.post(path,
//           data: isFormData && data is! FormData
//               ? FormData.fromMap(data as Map<String, dynamic>)
//               : data,
//           queryParameters: queryParameter,
//           options: Options(headers: {
//             if (isProtected)
//               'Authorization':
//                   'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
//           }));
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }

//   @override
//   Future put(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameter,
//       bool isFormData = true,
//       bool isProtected = false,
//       bool sendRefreshToken = false}) async {
//     try {
//       final response = await dio.put(path,
//           data: isFormData && data is! FormData
//               ? FormData.fromMap(data as Map<String, dynamic>)
//               : data,
//           queryParameters: queryParameter,
//           options: Options(headers: {
//             if (isProtected)
//               'Authorization':
//                   'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
//           }));
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }

//   void handleDioExceptions(DioException e) {
//     try {
//       print("❗ DioException caught:");
//       print("➡ Message: ${e.message}");
//       print("➡ Status code: ${e.response?.statusCode}");

//       dynamic data = e.response?.data;
//       String serverMessage = 'Unknown error occurred';

//       if (data is Map<String, dynamic>) {
//         serverMessage = data['message'] ?? serverMessage;
//       } else if (data is String) {
//         print("❗ Response is HTML or raw string:\n$data");
//         serverMessage = 'Internal server error or unexpected response format.';
//       } else if (data == null) {
//         serverMessage = 'No response from server.';
//       }

//       print("➡ Parsed message: $serverMessage");

//       final error = AppException.fromDio(e);
//       throw error;
//     } catch (err, stack) {
//       print("🔥 Exception while handling DioException: $err");
//       print("📌 StackTrace: $stack");
//       rethrow;
//     }
//   }
// }