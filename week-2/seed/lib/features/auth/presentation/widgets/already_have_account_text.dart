import 'package:flutter/material.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            'لديك حساب بالفعل ؟ ',
            style: AppStyles.font14TextPrimaryRegular,
            textDirection: TextDirection.rtl,
          ),
          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(Routes.loginScreen);
            },
            child: Column(
              children: [
                Text(
                  'تسجيل الدخول',
                  style: AppStyles.font14PrimaryHeavy,
                  textDirection: TextDirection.rtl,
                ),
                Container(height: 1, width: 81, color: ColorsManager.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
