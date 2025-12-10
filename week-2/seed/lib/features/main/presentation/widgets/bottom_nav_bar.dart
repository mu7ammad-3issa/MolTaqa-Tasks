import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed/core/constants/app_assets.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Assets.iconsMore,
            label: 'المزيد',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          _NavItem(
            icon: Assets.iconsAddCircle,
            label: 'اضافة اعلان',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _NavItem(
            icon: Assets.iconsDocument,
            label: 'اعلاناتي',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _NavItem(
            icon: Assets.iconsHome,
            label: 'الرئيسية',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
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
            icon,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? ColorsManager.white
                  : ColorsManager.white.withOpacity(0.6),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w300,
              color: isSelected
                  ? ColorsManager.white
                  : ColorsManager.white.withOpacity(0.6),
              letterSpacing: -0.29,
            ),
          ),
        ],
      ),
    );
  }
}
