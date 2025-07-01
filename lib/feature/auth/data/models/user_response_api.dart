import 'package:shop_ecommerce/feature/auth/data/models/user_model_from_api.dart';

class UserResponseApi {
    UserResponseApi({
        required this.accessToken,
        required this.refreshToken,
        required this.status,
        required this.user,
    });

    final String? accessToken;
    final String? refreshToken;
    final bool? status;
    final UserModelFromApi? user;

    factory UserResponseApi.fromJson(Map<String, dynamic> json){ 
        return UserResponseApi(
            accessToken: json["access_token"],
            refreshToken: json["refresh_token"],
            status: json["status"],
            user: json["user"] == null ? null : UserModelFromApi.fromJson(json["user"]),
        );
    }

}

