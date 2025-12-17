import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/features/home/presentation/cubit/home_cubit.dart';
import 'package:seed/features/home/presentation/cubit/home_state.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/cities_list.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/cities_shimmer_loading.dart';

class CitiesBlocBuilder extends StatelessWidget {
  const CitiesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is CitiesLoading ||
          current is CitiesSuccess ||
          current is CitiesFailure,

      builder: (context, state) {
        if (state is CitiesLoading) {
          return const CitiesShimmerLoading();
        }
        if (state is CitiesFailure) {
          return const SizedBox.shrink();
        }
        if (state is CitiesSuccess) {
          return CitiesList(
            cities: state.cities,
            selectedCityId: state.selectedCityId,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
