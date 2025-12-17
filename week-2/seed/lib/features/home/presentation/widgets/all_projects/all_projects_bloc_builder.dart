import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/cubit/home_cubit.dart';
import 'package:seed/features/home/presentation/cubit/home_state.dart';
import 'package:seed/features/home/presentation/widgets/all_projects/all_projects_list.dart';
import 'package:seed/features/home/presentation/widgets/all_projects/all_projects_shimmer_loading.dart';

class AllProjectsBlocBuilder extends StatelessWidget {
  const AllProjectsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is AdvertisementsLoading ||
          current is AdvertisementsSuccess ||
          current is AdvertisementsFailure,
      builder: (context, state) {
        if (state is AdvertisementsLoading) {
          return Padding(
            padding: context.symmetric(horizontal: 24.w, vertical: 20.h),
            child: const AllProjectsShimmerLoading(),
          );
        }
        if (state is AdvertisementsFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                state.message,
                style: TextStyle(color: ColorsManager.textSecondary),
              ),
            ),
          );
        }
        if (state is AdvertisementsSuccess) {
          if (state.advertisements.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'لا توجد مشاريع',
                  style: TextStyle(color: ColorsManager.textSecondary),
                ),
              ),
            );
          }
          return AllProjectsList(advertisements: state.advertisements);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
