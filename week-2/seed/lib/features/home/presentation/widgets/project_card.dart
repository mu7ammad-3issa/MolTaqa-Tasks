import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/widgets/project_info_row.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String location;
  final String type;
  final String amount;
  final String percentage;
  final String evaluation;
  final String imageUrl;
  final bool isElectronic;

  const ProjectCard({
    super.key,
    required this.title,
    required this.location,
    required this.type,
    required this.amount,
    required this.percentage,
    required this.evaluation,
    required this.imageUrl,
    this.isElectronic = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          // Project Details
          Expanded(child: _buildProjectDetails()),
          horizontalSpace(8),
          // Project Image
          _buildProjectImage(),
        ],
      ),
    );
  }

  Widget _buildProjectImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Image.asset(
        imageUrl,
        width: 97.w,
        height: 103.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProjectDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: AppStyles.font14DarkBlueMedium.copyWith(
            color: ColorsManager.black,
          ),
        ),
        verticalSpace(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(flex: 1),
            // Second Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ProjectInfoRow(icon: Assets.iconsMoneySend, text: amount),
                verticalSpace(4),
                ProjectInfoRow(
                  icon: Assets.iconsPercentageCircle,
                  text: percentage,
                ),
              ],
            ),
            Spacer(flex: 2),
            // First Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ProjectInfoRow(icon: Assets.iconsLocation, text: location),
                verticalSpace(4),
                ProjectInfoRow(
                  icon: isElectronic
                      ? Assets.iconsMonitor
                      : Assets.iconsBuliding,
                  text: type,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(4),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'تقييم المشروع : ',
                style: AppStyles.font12TextSecondaryLight,
              ),
              TextSpan(
                text: evaluation,
                style: AppStyles.font14PrimaryHeavy.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
