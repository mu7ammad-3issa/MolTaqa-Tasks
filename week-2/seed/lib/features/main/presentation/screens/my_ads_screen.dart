import 'package:flutter/material.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/main/data/models/ad_model.dart';
import 'package:seed/features/main/data/models/ad_status.dart';
import 'package:seed/features/main/presentation/widgets/ad_filter_chips.dart';
import 'package:seed/features/main/presentation/widgets/ads_list.dart';
import 'package:seed/features/main/presentation/widgets/my_ads_header.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  AdStatus _selectedStatus = AdStatus.all;

  // Sample data
  final List<AdModel> _ads = [
    AdModel(
      title: 'انشاء مركز طبي',
      location: 'الرياض',
      type: 'الكتروني',
      amount: '90,00 ريال',
      percentage: '25 %',
      evaluation: '1,000000',
      imageUrl: Assets.imagesProjectCard,
      status: AdStatus.underConstruction,
      isElectronic: true,
    ),
    AdModel(
      title: 'انشاء مركز تجاري',
      location: 'الرياض',
      type: 'غير الكتروني',
      amount: '140,000 ريال',
      percentage: '25 %',
      evaluation: '1,000000',
      imageUrl: Assets.imagesProjectCard,
      status: AdStatus.rejected,
      isElectronic: false,
    ),
    AdModel(
      title: 'انشاء فندق',
      location: 'الرياض',
      type: 'الكتروني',
      amount: '150,000 ريال',
      percentage: '25 %',
      evaluation: '1,000000',
      imageUrl: Assets.imagesProjectCard,
      status: AdStatus.published,
      isElectronic: true,
    ),
    AdModel(
      title: 'انشاء ملعب رياضي',
      location: 'الرياض',
      type: 'الكتروني',
      amount: '120,000 ريال',
      percentage: '25 %',
      evaluation: '1,000000',
      imageUrl: Assets.imagesProjectCard,
      status: AdStatus.hidden,
      isElectronic: true,
    ),
    AdModel(
      title: 'انشاء عمارة سكنية',
      location: 'الرياض',
      type: 'الكتروني',
      amount: '80,000 ريال',
      percentage: '25 %',
      evaluation: '1,000000',
      imageUrl: Assets.imagesProjectCard,
      status: AdStatus.archived,
      isElectronic: true,
    ),
  ];

  void _onStatusChanged(AdStatus status) {
    setState(() {
      _selectedStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: Column(
        children: [
          const MyAdsHeader(),
          verticalSpace(20),
          AdFilterChips(
            selectedStatus: _selectedStatus,
            onStatusChanged: _onStatusChanged,
          ),
          verticalSpace(16),
          Expanded(
            child: AdsList(ads: _ads, selectedStatus: _selectedStatus),
          ),
        ],
      ),
    );
  }
}
