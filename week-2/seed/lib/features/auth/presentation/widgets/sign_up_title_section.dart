import 'package:flutter/material.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';

class SignUpTitleSection extends StatelessWidget {
  const SignUpTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'إنشاء حساب',
          style: AppStyles.font24PrimaryHeavy,
          textDirection: TextDirection.rtl,
        ),
        verticalSpace(8),
        Text(
          'ادخل بياناتك وقم بانشاء حساب خاص بك',
          style: AppStyles.font18SecondaryMedium,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
