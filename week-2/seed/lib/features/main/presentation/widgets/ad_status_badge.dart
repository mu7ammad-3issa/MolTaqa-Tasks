import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/features/main/data/models/ad_status.dart';

class AdStatusBadge extends StatelessWidget {
  final AdStatus status;

  const AdStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == AdStatus.all) return const SizedBox.shrink();

    return Container(
      padding: context.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(380.r),
      ),
      child: Text(status.label, style: AppStyles.font14StatusWhiteLight),
    );
  }
}
