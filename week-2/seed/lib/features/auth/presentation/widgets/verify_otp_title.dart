import 'package:flutter/material.dart';
import 'package:seed/core/theming/app_styles.dart';

class VerifyOtpTitle extends StatelessWidget {
  const VerifyOtpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'تأكيد رقم الهاتف',
      style: AppStyles.font24PrimaryHeavy,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
    );
  }
}
