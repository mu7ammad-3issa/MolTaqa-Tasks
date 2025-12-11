import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/widgets/all_projects_screen_header.dart';
import 'package:seed/features/home/presentation/widgets/project_card.dart';

class AllProjectsScreen extends StatelessWidget {
  final String selectedCity = 'الرياض';
  const AllProjectsScreen({super.key});

  // Sample projects data
  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'انشاء مركز طبي',
      'location': 'الرياض',
      'type': 'الكتروني',
      'amount': '90,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': true,
    },
    {
      'title': 'انشاء مركز تجاري',
      'location': 'الرياض',
      'type': 'غير الكتروني',
      'amount': '140,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': false,
    },
    {
      'title': 'انشاء فندق',
      'location': 'الرياض',
      'type': 'الكتروني',
      'amount': '150,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': true,
    },
    {
      'title': 'انشاء ملعب رياضي',
      'location': 'الرياض',
      'type': 'الكتروني',
      'amount': '120,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': true,
    },
    {
      'title': 'انشاء عمارة سكنية',
      'location': 'الرياض',
      'type': 'الكتروني',
      'amount': '80,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: Column(
        children: [
          // Custom Header
          AllProjectsScreenHeader(selectedCity: selectedCity),
          // Projects List
          Expanded(
            child: ListView.separated(
              padding: context.symmetric(horizontal: 24.w, vertical: 20.h),
              itemCount: projects.length,
              separatorBuilder: (context, index) => verticalSpace(12),
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  title: project['title'],
                  location: project['location'],
                  type: project['type'],
                  amount: project['amount'],
                  percentage: project['percentage'],
                  evaluation: project['evaluation'],
                  imageUrl: project['imageUrl'],
                  isElectronic: project['isElectronic'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
