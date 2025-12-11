import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/colors_manager.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      decoration: const BoxDecoration(color: ColorsManager.primary),
      child: Padding(
        padding: context.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            _NavItem(
              icon: Assets.iconsMore,
              iconFilled: Assets.iconsMoreFilled,
              label: 'المزيد',
              isSelected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
            Spacer(),
            _NavItem(
              icon: Assets.iconsAddCircle,
              iconFilled: Assets.iconsAddCircleFilled,
              label: 'اضافة اعلان',
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            Spacer(),
            _NavItem(
              icon: Assets.iconsDocument,
              iconFilled: Assets.iconsDocumentFilled,
              label: 'اعلاناتي',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            Spacer(),
            _NavItem(
              icon: Assets.iconsHome,
              iconFilled: Assets.iconsHomeFilled,
              label: 'الرئيسية',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String iconFilled;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.iconFilled,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isSelected ? iconFilled : icon,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? ColorsManager.white
                  : ColorsManager.white.withValues(alpha: 0.6),
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w300,
              color: isSelected
                  ? ColorsManager.white
                  : ColorsManager.white.withValues(alpha: 0.6),
              letterSpacing: -0.29,
            ),
          ),
        ],
      ),
    );
  }
}
