import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class AdFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AdFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 77.w,
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(380.r),
          border: Border.all(
            color: isSelected ? ColorsManager.primary : ColorsManager.gray,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? AppStyles.font14StatusWhiteMedium
                : AppStyles.font14StatusGrayLight,
          ),
        ),
      ),
    );
  }
}
