import 'package:flutter/material.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';

class ChangeNumberTitle extends StatelessWidget {
  const ChangeNumberTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'تغيير رقم الهاتف',
          style: AppStyles.font24PrimaryHeavy,
          textDirection: TextDirection.rtl,
        ),
        verticalSpace(8),
        Text(
          'ادخل رقم جوالك الجديد لتحديث حسابك',
          style: AppStyles.font18SecondaryMedium,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
