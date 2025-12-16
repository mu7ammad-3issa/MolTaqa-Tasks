import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';
import 'package:seed/features/home/presentation/cubit/cities_cubit.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/city_chip.dart';

class CitiesList extends StatelessWidget {
  final List<CityEntity> cities;
  final int? selectedCityId;

  const CitiesList({super.key, required this.cities, this.selectedCityId});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      reverse: true,
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        final isSelected = city.id == selectedCityId;
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: index == cities.length - 1 ? 0 : 7.w,
          ),
          child: CityChip(
            city: city,
            isSelected: isSelected,
            onTap: () {
              context.read<CitiesCubit>().selectCity(city.id);
            },
          ),
        );
      },
    );
  }
}
