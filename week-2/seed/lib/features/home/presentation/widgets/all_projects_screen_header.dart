import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class AllProjectsScreenHeader extends StatelessWidget {
  final String selectedCity;
  const AllProjectsScreenHeader({super.key, required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        border: Border(
          bottom: BorderSide(color: ColorsManager.lighterGray, width: 1),
        ),
      ),
      child: Column(
        children: [
          verticalSpace(79),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(selectedCity, style: AppStyles.font16TextPrimaryHeavy),
              horizontalSpace(8),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorsManager.gray,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
