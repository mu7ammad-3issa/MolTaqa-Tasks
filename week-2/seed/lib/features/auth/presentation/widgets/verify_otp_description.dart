import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class VerifyOtpDescription extends StatelessWidget {
  final String phoneNumber;
  final String remainingTime;
  final VoidCallback onChangeNumber;

  const VerifyOtpDescription({
    super.key,
    required this.phoneNumber,
    required this.remainingTime,
    required this.onChangeNumber,
  });

  //  mask the phone number
  String get _maskedPhoneNumber {
    final lastThreeDigits = phoneNumber.substring(phoneNumber.length - 3);
    return '*** *** $lastThreeDigits';
  }

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
                'لتأكيد حسابك قم بادخال الكود المكون من 4 ارقام الذي تم ارساله في رساله الي رقم الهاتف $_maskedPhoneNumber ',
          ),
          TextSpan(
            text: '(تغيير الرقم)',
            style: AppStyles.font18SecondaryMedium.copyWith(
              color: ColorsManager.primary,
            ),
            recognizer: TapGestureRecognizer()..onTap = onChangeNumber,
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
