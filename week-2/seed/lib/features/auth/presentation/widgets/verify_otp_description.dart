import 'package:flutter/material.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class VerifyOtpDescription extends StatelessWidget {
  final String phoneNumber;
  final String remainingTime;

  const VerifyOtpDescription({
    super.key,
    required this.phoneNumber,
    required this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      text: TextSpan(
        style: AppStyles.font18SecondaryMedium,
        children: [
          TextSpan(
            text:
                'لتأكيد حسابك قم بادخال الكود المكون من 4 ارقام الذي تم ارساله في رساله الي رقم الهاتف $phoneNumber ',
          ),
          TextSpan(
            text: '(تغيير الرقم)',
            style: AppStyles.font18SecondaryMedium.copyWith(
              color: ColorsManager.primary,
            ),
          ),
          const TextSpan(text: ' , ٍسيصلك الكود خلال '),
          TextSpan(
            text: remainingTime,
            style: AppStyles.font18SecondaryMedium.copyWith(
              color: ColorsManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}
