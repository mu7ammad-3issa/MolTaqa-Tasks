import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';
import 'package:seed/features/home/presentation/cubit/home_cubit.dart';
import 'package:seed/features/home/presentation/widgets/cities_list/city_chip.dart';

class CitiesList extends StatefulWidget {
  final List<CityEntity> cities;
  final int? selectedCityId;

  const CitiesList({super.key, required this.cities, this.selectedCityId});

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  @override
  Widget build(BuildContext context) {
    // Add 1 for the "All" option
    final totalItems = widget.cities.length + 1;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      reverse: true,
      itemCount: totalItems,
      itemBuilder: (context, index) {
        if (index == 0) {
          final isAllSelected = widget.selectedCityId == null;
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 7.w),
            child: CityChip(
              city: CityEntity(id: -1, name: 'الكل'),
              isSelected: isAllSelected,
              onTap: () {
                context.read<HomeCubit>().getAdvertisements();
              },
            ),
          );
        }

        final city = widget.cities[index - 1];
        final isSelected = city.id == widget.selectedCityId;
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: index == totalItems - 1 ? 0 : 7.w,
          ),
          child: CityChip(
            city: city,
            isSelected: isSelected,
            onTap: () {
              context.read<HomeCubit>().getAdvertisements(
                cityId: city.id,
                cityName: city.name,
              );
            },
          ),
        );
      },
    );
  }
}
