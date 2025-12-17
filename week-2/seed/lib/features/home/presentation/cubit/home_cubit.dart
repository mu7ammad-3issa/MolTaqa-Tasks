import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';
import 'package:seed/features/home/domain/use_cases/get_advertisements_use_case.dart';
import 'package:seed/features/home/domain/use_cases/get_cities_use_case.dart';
import 'package:seed/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCitiesUseCase getCitiesUseCase;
  final GetAdvertisementsUseCase getAdvertisementsUseCase;

  List<CityEntity> _cities = [];
  int? _selectedCityId;
  String _selectedCityName = 'الكل';

  HomeCubit(this.getCitiesUseCase, this.getAdvertisementsUseCase)
    : super(HomeInitial());

  // Getters to expose selected city info
  int? get selectedCityId => _selectedCityId;
  String get selectedCityName => _selectedCityName;

  Future<void> getCities() async {
    emit(CitiesLoading());
    final result = await getCitiesUseCase();
    result.fold((failure) => emit(CitiesFailure(failure.message)), (cities) {
      _cities = cities;
      emit(CitiesSuccess(cities: cities, selectedCityId: _selectedCityId));
    });
  }

  Future<void> getAdvertisements({int? cityId, String? cityName}) async {
    _selectedCityId = cityId;
    // Update selected city name
    if (cityId == null) {
      _selectedCityName = 'الكل';
    } else if (cityName != null) {
      _selectedCityName = cityName;
    } else if (_cities.isNotEmpty) {
      final city = _cities.firstWhere(
        (c) => c.id == cityId,
        orElse: () => CityEntity(id: -1, name: 'الكل'),
      );
      _selectedCityName = city.name;
    }

    if (_cities.isNotEmpty) {
      emit(CitiesSuccess(cities: _cities, selectedCityId: _selectedCityId));
    }

    emit(AdvertisementsLoading());
    final result = await getAdvertisementsUseCase(cityId);
    result.fold(
      (failure) => emit(AdvertisementsFailure(failure.message)),
      (advertisements) => emit(AdvertisementsSuccess(advertisements)),
    );
  }
}
