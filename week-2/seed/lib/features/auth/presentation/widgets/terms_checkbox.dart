import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/auth/presentation/widgets/terms_and_condition_dialog.dart';

class TermsCheckbox extends StatelessWidget {
  final bool isAccepted;
  final VoidCallback onTap;

  const TermsCheckbox({
    super.key,
    required this.isAccepted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => TermsAndConditionDialog(
                    onAccept: isAccepted == false ? onTap : () {},
                  ),
                );
              },
              child: Text(
                'الموافقه علي الشروط والأحكام',
                style: AppStyles.font14TextPrimaryLight,
                textDirection: TextDirection.rtl,
              ),
            ),
            verticalSpace(4),
            Container(height: 1, width: 172, color: ColorsManager.black),
          ],
        ),
        horizontalSpace(4),
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Checkbox(
            value: isAccepted,
            onChanged: (value) => onTap(),
            activeColor: ColorsManager.primary,
            checkColor: ColorsManager.white,
            side: BorderSide(
              color: isAccepted
                  ? ColorsManager.primary
                  : ColorsManager.lighterGray,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
