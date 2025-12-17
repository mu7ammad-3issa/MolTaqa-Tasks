import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/features/home/presentation/cubit/home_cubit.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/cities_bloc_builder.dart';
import 'package:seed/features/home/presentation/widgets/section_header.dart';

class CitiesSection extends StatefulWidget {
  const CitiesSection({super.key});

  @override
  State<CitiesSection> createState() => _CitiesSectionState();
}

class _CitiesSectionState extends State<CitiesSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCities();
    context.read<HomeCubit>().getAdvertisements();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        SectionHeader(
          title: 'المدن',
          onSeeAllTap: () {
            // Handle see all logic
          },
        ),
        verticalSpace(16),
        // Cities List
        SizedBox(height: 48.h, child: const CitiesBlocBuilder()),
      ],
    );
  }
}
