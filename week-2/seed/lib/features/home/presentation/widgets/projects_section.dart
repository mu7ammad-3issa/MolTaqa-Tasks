import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/features/home/presentation/widgets/project_card.dart';
import 'package:seed/features/home/presentation/widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        SectionHeader(
          title: 'المشاريع',
          onSeeAllTap: () {
            // Handle see all logic
          },
        ),
        verticalSpace(16.h),
        // Projects List
        Column(
          children: [
            const ProjectCard(
              title: 'انشاء مركز طبي',
              location: 'الرياض',
              type: 'الكتروني',
              amount: '100,000 ريال',
              percentage: '25 %',
              evaluation: '1,000000',
              imageUrl: Assets.imagesProjectCard,
              isElectronic: true,
            ),
            verticalSpace(12),
            const ProjectCard(
              title: 'انشاء مركز تجاري',
              location: 'الرياض',
              type: 'غير الكتروني',
              amount: '140,000 ريال',
              percentage: '25 %',
              evaluation: '1,000000',
              imageUrl: Assets.imagesProjectCard,
              isElectronic: false,
            ),
          ],
        ),
      ],
    );
  }
}
