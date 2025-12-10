import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class VerifyOtpInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onCompleted;

  const VerifyOtpInput({
    super.key,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 72.w,
      height: 72.w,
      textStyle: AppStyles.font24PrimaryHeavy,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDFDFDF)),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorsManager.primary),
      borderRadius: BorderRadius.circular(8.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: ColorsManager.primary),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        showCursor: true,
        onCompleted: onCompleted,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
