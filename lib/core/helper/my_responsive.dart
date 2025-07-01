import 'package:flutter/widgets.dart';

abstract class MyResponsive {
  static double height(context, double value) =>
      MediaQuery.of(context).size.height * (value / 812);
  static double width(context, double value) =>
      MediaQuery.of(context).size.width * (value / 375);
}
