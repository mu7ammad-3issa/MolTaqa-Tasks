import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:shimmer/shimmer.dart';

class AllProjectsShimmerLoading extends StatelessWidget {
  const AllProjectsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: ColorsManager.lighterGray,
          highlightColor: ColorsManager.white,
          child: Container(
            height: 127.h,
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        );
      },
    );
  }
}
