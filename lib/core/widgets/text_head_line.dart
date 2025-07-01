import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class TextHeadLine extends StatelessWidget {
  const TextHeadLine({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: Styles.text18W600);
  }
}