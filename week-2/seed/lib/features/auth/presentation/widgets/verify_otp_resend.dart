import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class VerifyOtpResend extends StatelessWidget {
  final VoidCallback onResend;

  const VerifyOtpResend({super.key, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onResend,
          child: Column(
            children: [
              Text(
                'اعادة ارسال الكود',
                style: AppStyles.font14TextSecondaryMedium.copyWith(
                  color: ColorsManager.primary,
                ),
                textDirection: TextDirection.rtl,
              ),
              verticalSpace(2),
              Container(height: 1, width: 98.w, color: ColorsManager.primary),
            ],
          ),
        ),
        Text(
          'لم تصلك رسالة تأكيد ؟ ',
          style: AppStyles.font14TextSecondaryMedium,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
