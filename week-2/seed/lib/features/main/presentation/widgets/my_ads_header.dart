import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class MyAdsHeader extends StatelessWidget {
  const MyAdsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        border: Border(
          bottom: BorderSide(color: ColorsManager.lighterGray, width: 1),
        ),
      ),
      child: Column(
        children: [
          verticalSpace(89),
          Padding(
            padding: context.only(right: 24.w, bottom: 16.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('اعلاناتي', style: AppStyles.font16TextPrimaryHeavy),
            ),
          ),
        ],
      ),
    );
  }
}
