import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class MyNavigator {
  static goToOff(
      {required screen,
      bool isReplaceOffAll = false,
      Transition transition = Transition.rightToLeftWithFade,
      Duration? duration}) {
    if (isReplaceOffAll) {
      Get.offAll(screen,
          transition: Intl.defaultLocale == "en"
              ? Transition.rightToLeftWithFade
              : Transition.leftToRightWithFade,
          duration: duration ?? const Duration(seconds: 1));
    } else {
      Get.off(screen,
          transition: Intl.defaultLocale == "en"
              ? Transition.rightToLeftWithFade
              : Transition.leftToRightWithFade,
          duration: duration ?? const Duration(seconds: 1));
    }
  }

  static goTo(
      {required screen,
      Transition transition = Transition.rightToLeftWithFade,
      Duration? duration}) {
    Get.to(screen,
        transition: Intl.defaultLocale == "en"
            ? Transition.rightToLeftWithFade
            : Transition.leftToRightWithFade,
        duration: duration ?? const Duration(seconds: 1));
  }

  static pop(context) {
    Get.back();
  }
}
