import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final bool isPassword;
  final String? prefixIcon;
  final Widget? suffixIcon;

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: MyResponsive.width(context, 32),
          bottom: 10,
          end: MyResponsive.width(context, 26)),
      child: SizedBox(
        height: MyResponsive.height(context, 55),
        width: double.infinity,
        child: TextFormField(
          controller: widget.controller,
          obscureText: _isObscured,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.grey3,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: SizedBox(
                        height: 14,
                        width: 18,
                        child: Icon(
                          _isObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColor.grey4,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : widget.suffixIcon ?? const SizedBox.shrink(),
              prefixIcon: widget.prefixIcon != null
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        widget.prefixIcon!,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  : null,
              labelText: widget.label,
              labelStyle: Styles.text12W500,
              border: borderFunction(AppColor.grey),
              focusedBorder: borderFunction(Colors.green),
              enabledBorder: borderFunction(AppColor.grey4),
              focusedErrorBorder: borderFunction(Colors.red),
              errorBorder: borderFunction(Colors.red)),
          validator: widget.validator,
        ),
      ),
    );
  }
}

borderFunction(Color color1) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color1,
      ));
}
