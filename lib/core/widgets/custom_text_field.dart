import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_shop_admin/config/local/cache_helper.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.onChanged,
    required this.title,
    this.suffixIcon,
    required this.hintText,
    this.maxLength,
    this.textInputType,
    this.obscureText = false,
    this.prefixIcon,
    this.paddingForTop,
    this.paddingForBottom,
    this.maxLines,
    this.readOnly = false, this.textInputAction, this.minLines,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final double? paddingForTop;
  final double? paddingForBottom;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.font16WhiteRegular,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: paddingForTop ?? AppConstants.defaultPadding,
            bottom: paddingForBottom ?? AppConstants.padding15h,
          ),
          child: TextFormField(
            style: TextStyle(color: AppColors.grey),
            readOnly: readOnly,
            onTapOutside: (value) {
              FocusScope.of(context).unfocus();
            },
            textInputAction: textInputAction,
            maxLines: maxLines ?? 1,
            minLines: minLines,
            controller: controller,
            keyboardType: textInputType,
            maxLength: maxLength,
            obscureText: obscureText,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              counterStyle: TextStyle(color: CacheHelper.getData(key: 'isDark')?AppColors.white:AppColors.black),
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              filled: true,
              isDense: true,
              hintStyle: AppStyles.font14GreyRegular.copyWith(color: AppColors.grey),
              fillColor: AppColors.grey50,
              border: AppConstants.enabledBorder,
              focusedBorder: AppConstants.focusedBorder,
            ),
          ),
        ),
      ],
    );
  }
}
