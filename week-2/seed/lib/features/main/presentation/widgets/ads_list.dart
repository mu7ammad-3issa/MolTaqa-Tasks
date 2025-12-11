import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/features/main/data/models/ad_model.dart';
import 'package:seed/features/main/data/models/ad_status.dart';
import 'package:seed/features/main/presentation/widgets/ad_card.dart';

class AdsList extends StatelessWidget {
  final List<AdModel> ads;
  final AdStatus selectedStatus;

  const AdsList({super.key, required this.ads, required this.selectedStatus});

  List<AdModel> get _filteredAds {
    if (selectedStatus == AdStatus.all) return ads;
    return ads.where((ad) => ad.status == selectedStatus).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAds = _filteredAds;

    return ListView.separated(
      padding: context.symmetric(horizontal: 24.w),
      itemCount: filteredAds.length,
      separatorBuilder: (context, index) => verticalSpace(12),
      itemBuilder: (context, index) {
        final ad = filteredAds[index];
        return AdCard(
          title: ad.title,
          location: ad.location,
          type: ad.type,
          amount: ad.amount,
          percentage: ad.percentage,
          evaluation: ad.evaluation,
          imageUrl: ad.imageUrl,
          isElectronic: ad.isElectronic,
          status: ad.status,
        );
      },
    );
  }
}
