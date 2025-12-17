import 'package:seed/features/home/domain/entities/advertisement_entity.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

// Cities States
class CitiesLoading extends HomeState {}

class CitiesSuccess extends HomeState {
  final List<CityEntity> cities;
  final int? selectedCityId;

  CitiesSuccess({required this.cities, this.selectedCityId});
}

class CitiesFailure extends HomeState {
  final String message;

  CitiesFailure(this.message);
}

// Advertisements States
class AdvertisementsLoading extends HomeState {}

class AdvertisementsSuccess extends HomeState {
  final List<AdvertisementEntity> advertisements;

  AdvertisementsSuccess(this.advertisements);
}

class AdvertisementsFailure extends HomeState {
  final String message;

  AdvertisementsFailure(this.message);
}
