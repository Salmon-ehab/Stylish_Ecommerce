import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class MyNavigator {
  static goTo(
      {required screen,
      bool isReplace = false,
      Transition transition = Transition.rightToLeftWithFade,
      Duration? duration}) {
    if (isReplace) {
      Get.offAll(screen,
          transition: Intl.defaultLocale == "en"
              ? Transition.rightToLeftWithFade
              : Transition.leftToRightWithFade,
          duration: duration ?? const Duration(seconds: 1));
    } else {
      Get.to(screen,
          transition: Intl.defaultLocale == "en"
              ? Transition.rightToLeftWithFade
              : Transition.leftToRightWithFade,
          duration: duration ?? const Duration(seconds: 1));
    }
  }

  static pop(context) {
    Get.back();
  }
}
