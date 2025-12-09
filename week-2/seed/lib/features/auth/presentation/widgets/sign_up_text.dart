import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.pushReplacementNamed(Routes.signUpScreen);
          },
          child: Column(
            children: [
              Text(
                'إنشاء حساب',
                style: AppStyles.font14PrimaryHeavy,
                textDirection: TextDirection.rtl,
              ),
              verticalSpace(4),
              Container(
                height: 1,
                width: 71.w,
                decoration: BoxDecoration(color: ColorsManager.primary),
              ),
            ],
          ),
        ),
        horizontalSpace(4),
        Text(
          'ليس لديك حساب ؟',
          style: AppStyles.font14TextPrimaryRegular,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
