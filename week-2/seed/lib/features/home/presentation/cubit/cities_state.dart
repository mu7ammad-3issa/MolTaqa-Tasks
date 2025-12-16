import 'package:seed/features/home/domain/entities/city_entity.dart';

abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesSuccess extends CitiesState {
  final List<CityEntity> cities;
  final int? selectedCityId;

  CitiesSuccess({required this.cities, this.selectedCityId});

  CitiesSuccess copyWith({List<CityEntity>? cities, int? selectedCityId}) {
    return CitiesSuccess(
      cities: cities ?? this.cities,
      selectedCityId: selectedCityId ?? this.selectedCityId,
    );
  }
}

class CitiesFailure extends CitiesState {
  final String message;

  CitiesFailure(this.message);
}
