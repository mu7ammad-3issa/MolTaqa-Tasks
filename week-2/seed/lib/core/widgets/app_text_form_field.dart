import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/theming/app_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextDirection? textDirection;
  final String? label;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.textDirection,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label ?? '',
          style: AppStyles.font16TextPrimaryMedium,
          textDirection: TextDirection.rtl,
        ),
        label != '' ? verticalSpace(8) : SizedBox.shrink(),
        TextFormField(
          controller: controller,
          textDirection: textDirection,
          cursorColor: ColorsManager.primary,
          cursorWidth: 1,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                contentPadding ??
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
            focusedBorder:
                focusedBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
            enabledBorder:
                enabledBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.lighterGray,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            suffixIcon: Padding(
              padding: context.only(right: 8.w),
              child: suffixIcon,
            ),
            suffixIconConstraints: BoxConstraints(),
            fillColor: backgroundColor ?? ColorsManager.white,
            filled: true,
          ),
          obscureText: isObscureText ?? false,
          style: TextStyles.font14DarkBlueMedium,
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
