import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';

class CityChip extends StatelessWidget {
  final CityEntity city;
  final bool isSelected;
  final VoidCallback onTap;

  const CityChip({
    super.key,
    required this.city,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: context.symmetric(horizontal: 17.5.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.lightBlue.withValues(alpha: 0.5)
              : ColorsManager.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? ColorsManager.primary
                : ColorsManager.lighterGray,
            width: 1,
          ),
        ),
        child: Text(
          city.name,
          style: isSelected
              ? AppStyles.font16TextPrimaryMedium
              : AppStyles.font16TextPrimaryMedium.copyWith(
                  color: ColorsManager.textSecondary,
                ),
        ),
      ),
    );
  }
}
