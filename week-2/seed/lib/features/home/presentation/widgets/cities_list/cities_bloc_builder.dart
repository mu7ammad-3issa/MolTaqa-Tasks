import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/features/home/presentation/cubit/cities_cubit.dart';
import 'package:seed/features/home/presentation/cubit/cities_state.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/cities_list.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/cities_shimmer_loading.dart';

class CitiesBlocBuilder extends StatelessWidget {
  const CitiesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesCubit, CitiesState>(
      buildWhen: (previous, current) =>
          current is CitiesSuccess || current is CitiesFailure,
      builder: (context, state) {
        if (state is CitiesLoading) {
          return const CitiesShimmerLoading();
        }
        if (state is CitiesFailure) {
          return _setupFailure(state.message);
        }
        if (state is CitiesSuccess) {
          return _setupSuccess(state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _setupSuccess(CitiesSuccess state) {
    return CitiesList(
      cities: state.cities,
      selectedCityId: state.selectedCityId,
    );
  }

  Widget _setupFailure(String message) {
    return const SizedBox.shrink();
  }
}
