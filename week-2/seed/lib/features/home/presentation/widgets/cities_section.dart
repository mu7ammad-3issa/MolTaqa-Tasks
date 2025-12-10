import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/features/home/presentation/widgets/city_chip.dart';
import 'package:seed/features/home/presentation/widgets/section_header.dart';

class CitiesSection extends StatelessWidget {
  const CitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        SectionHeader(
          title: 'المدن',
          onSeeAllTap: () {
            // Handle see all logic
          },
        ),
        verticalSpace(16.h),
        // Cities List
        SizedBox(
          height: 48.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              const CityChip(city: 'الرياض', isSelected: true),
              horizontalSpace(7.w),
              const CityChip(city: 'جدة'),
              horizontalSpace(7.w),
              const CityChip(city: 'الدمام'),
              horizontalSpace(7.w),
              const CityChip(city: 'الرياض'),
            ],
          ),
        ),
      ],
    );
  }
}
