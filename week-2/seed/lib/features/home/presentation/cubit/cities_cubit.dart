import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/features/home/domain/use_cases/get_cities_use_case.dart';
import 'package:seed/features/home/presentation/cubit/cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final GetCitiesUseCase getCitiesUseCase;

  CitiesCubit(this.getCitiesUseCase) : super(CitiesInitial());

  Future<void> getCities() async {
    emit(CitiesLoading());
    final result = await getCitiesUseCase();
    result.fold(
      (failure) => emit(CitiesFailure(failure.message)),
      (cities) => emit(
        CitiesSuccess(
          cities: cities,
          selectedCityId: cities.isNotEmpty ? cities.first.id : null,
        ),
      ),
    );
  }

  void selectCity(int cityId) {
    final currentState = state;
    if (currentState is CitiesSuccess) {
      emit(currentState.copyWith(selectedCityId: cityId));
    }
  }
}
