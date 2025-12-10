import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/widgets/cities_section.dart';
import 'package:seed/features/home/presentation/widgets/home_header.dart';
import 'package:seed/features/home/presentation/widgets/projects_section.dart';
import 'package:seed/features/home/presentation/widgets/promotional_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: context.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              // Header with Logo
              const FractionallySizedBox(
                widthFactor: 1.15,
                child: HomeHeader(),
              ),
              verticalSpace(20),
              // Promotional Banner
              const PromotionalBanner(),
              verticalSpace(20),
              // Cities Section
              const CitiesSection(),
              verticalSpace(32),
              // Projects Section
              const ProjectsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
