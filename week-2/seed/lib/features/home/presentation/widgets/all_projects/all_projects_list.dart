import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/features/home/domain/entities/advertisement_entity.dart';
import 'package:seed/features/home/presentation/widgets/advertisements_list/advertisement_card.dart';

class AllProjectsList extends StatelessWidget {
  final List<AdvertisementEntity> advertisements;

  const AllProjectsList({super.key, required this.advertisements});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: context.symmetric(horizontal: 24.w, vertical: 20.h),
      itemCount: advertisements.length,
      separatorBuilder: (context, index) => verticalSpace(12),
      itemBuilder: (context, index) {
        final advertisement = advertisements[index];
        return AdvertisementCard(advertisement: advertisement);
      },
    );
  }
}
