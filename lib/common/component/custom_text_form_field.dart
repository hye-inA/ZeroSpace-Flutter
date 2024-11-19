import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String labelText;
  final String? hintText;
  final String? errorText;
  final bool obscureText; // 선택적이지만 기본값이 필요한 필드
  final bool autofocus; // non-nullable + 기본값: false
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;

  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    required this.onChanged,
    required this.textInputAction,
    required this.labelText,
    required this.keyboardType,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.focusNode,
    this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.grey, width: 1.6),
    );

    return TextFormField(
      cursorColor: AppColors.PRIMARY_GREEN,
      obscureText: obscureText,
      autofocus: autofocus,
      focusNode: focusNode,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: AppColors.BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: AppColors.INPUT_BG_COLOR,
        filled: true,
        // 모든 Input 상태의 기본 스타일 지정
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
          color: AppColors.LIGHT_GREY_COLOR,
        )),
      ),
    );
  }
}
