import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:shimmer/shimmer.dart';

class CitiesShimmerLoading extends StatelessWidget {
  const CitiesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.lighterGray,
      highlightColor: ColorsManager.white,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 4 ? 0 : 7.w),
            child: Container(
              width: 80.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorsManager.lighterGray, width: 1),
              ),
            ),
          );
        },
      ),
    );
  }
}
