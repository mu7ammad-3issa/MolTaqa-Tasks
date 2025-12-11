import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/features/main/data/models/ad_status.dart';
import 'package:seed/features/main/presentation/widgets/ad_filter_chip.dart';

class AdFilterChips extends StatelessWidget {
  final AdStatus selectedStatus;
  final ValueChanged<AdStatus> onStatusChanged;

  const AdFilterChips({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        reverse: true,
        padding: context.symmetric(horizontal: 24.w),
        itemCount: AdStatus.values.length,
        separatorBuilder: (context, index) => horizontalSpace(8),
        itemBuilder: (context, index) {
          final status = AdStatus.values[index];
          return AdFilterChip(
            label: status.label,
            isSelected: selectedStatus == status,
            onTap: () => onStatusChanged(status),
          );
        },
      ),
    );
  }
}
