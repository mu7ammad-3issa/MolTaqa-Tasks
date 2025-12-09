import 'package:flutter/material.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'مرحبا بك !',
          style: AppStyles.font24PrimaryHeavy,
          textDirection: TextDirection.rtl,
        ),
        verticalSpace(8),
        Text(
          'قم بتسجيل دخولك مرة اخرى',
          style: AppStyles.font18SecondaryMedium,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
