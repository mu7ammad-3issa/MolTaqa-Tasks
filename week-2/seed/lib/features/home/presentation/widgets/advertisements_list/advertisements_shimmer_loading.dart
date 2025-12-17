import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:shimmer/shimmer.dart';

class AdvertisementsShimmerLoading extends StatelessWidget {
  const AdvertisementsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: context.only(bottom: index < 2 ? 12.h : 0),
          child: Shimmer.fromColors(
            baseColor: ColorsManager.lighterGray,
            highlightColor: ColorsManager.white,
            child: Container(
              height: 130.h,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        );
      },
    );
  }
}
