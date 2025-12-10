import 'package:flutter/material.dart';
import 'package:seed/core/theming/app_styles.dart';

class VerifyOtpLabel extends StatelessWidget {
  const VerifyOtpLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'كود التأكيد',
      style: AppStyles.font16TextPrimaryMedium,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
    );
  }
}
