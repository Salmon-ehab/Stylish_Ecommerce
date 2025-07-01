import 'package:image_picker/image_picker.dart';

class UserModelToApi {
  final String name;
  final String phone;
  final XFile? image;
  final String email;
  final String password;
  final String confirmPassword;

  UserModelToApi(this.image,
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.confirmPassword});
}
