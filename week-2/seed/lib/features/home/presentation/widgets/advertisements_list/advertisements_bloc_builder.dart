import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/features/home/presentation/cubit/home_cubit.dart';
import 'package:seed/features/home/presentation/cubit/home_state.dart';
import 'package:seed/features/home/presentation/widgets/advertisements_list/advertisements_list.dart';
import 'package:seed/features/home/presentation/widgets/advertisements_list/advertisements_shimmer_loading.dart';

class AdvertisementsBlocBuilder extends StatelessWidget {
  const AdvertisementsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is AdvertisementsLoading ||
          current is AdvertisementsSuccess ||
          current is AdvertisementsFailure,
      builder: (context, state) {
        if (state is AdvertisementsLoading) {
          return const AdvertisementsShimmerLoading();
        }
        if (state is AdvertisementsFailure) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        if (state is AdvertisementsSuccess) {
          if (state.advertisements.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('لا توجد إعلانات'),
                ),
              ),
            );
          }
          return AdvertisementsList(advertisements: state.advertisements);
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
