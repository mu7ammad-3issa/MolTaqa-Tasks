import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/cities_section.dart';
import 'package:seed/features/home/presentation/widgets/home_header.dart';
import 'package:seed/features/home/presentation/widgets/projects_sliver_list.dart';
import 'package:seed/features/home/presentation/widgets/promotional_banner.dart';
import 'package:seed/features/home/presentation/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Header with Logo
          SliverToBoxAdapter(child: HomeHeader()),
          SliverToBoxAdapter(child: verticalSpace(20)),

          // Promotional Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: context.symmetric(horizontal: 24.w),
              child: const PromotionalBanner(),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),

          // Cities Section
          SliverToBoxAdapter(
            child: Padding(
              padding: context.symmetric(horizontal: 24.w),
              child: const CitiesSection(),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          // Projects Section Header
          SliverToBoxAdapter(
            child: Padding(
              padding: context.symmetric(horizontal: 24.w),
              child: SectionHeader(
                title: 'المشاريع',
                onSeeAllTap: () {
                  context.pushNamed(Routes.allProjectsScreen);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),

          // Projects List
          SliverPadding(
            padding: context.symmetric(horizontal: 24.w),
            sliver: const ProjectsSliverList(),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
        ],
      ),
    );
  }
}
