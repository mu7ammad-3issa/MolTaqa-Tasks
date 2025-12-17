import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/domain/entities/advertisement_entity.dart';
import 'package:seed/features/home/presentation/widgets/project_info_row.dart';

class AdvertisementCard extends StatelessWidget {
  final AdvertisementEntity advertisement;

  const AdvertisementCard({super.key, required this.advertisement});

  String _formatNumber(num number) {
    final intValue = number.toInt();
    return intValue.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String _formatMoney(num? amount) {
    if (amount == null) return '-';
    return '${_formatNumber(amount)} ريال';
  }

  String _formatEvaluation(num? amount) {
    if (amount == null) return '-';
    return _formatNumber(amount);
  }

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
      child: Image.network(
        advertisement.mainImage,
        width: 97.w,
        height: 103.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 97.w,
            height: 103.h,
            color: ColorsManager.lighterGray,
            child: Icon(
              Icons.image_not_supported,
              color: ColorsManager.textSecondary,
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectDetails() {
    final isElectronic = advertisement.isOnline == 1;
    final location = advertisement.city ?? '-';
    final type = isElectronic ? 'الكتروني' : 'غير الكتروني';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          advertisement.name,
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
                ProjectInfoRow(
                  icon: Assets.iconsMoneySend,
                  text: _formatMoney(advertisement.askMoney),
                ),
                verticalSpace(4),
                ProjectInfoRow(
                  icon: Assets.iconsPercentageCircle,
                  text: advertisement.partnershipRatio != null
                      ? '${advertisement.partnershipRatio} %'
                      : '-',
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
                text: _formatEvaluation(advertisement.totalProjectEvaluation),
                style: AppStyles.font14PrimaryHeavy.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
