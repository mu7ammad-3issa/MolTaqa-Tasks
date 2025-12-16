import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/no_params_use_case.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';
import 'package:seed/features/home/domain/repositories/cities_repo.dart';

class GetCitiesUseCase extends NoParamsUseCase<List<CityEntity>> {
  final CitiesRepo citiesRepo;

  GetCitiesUseCase(this.citiesRepo);

  @override
  Future<Either<Failure, List<CityEntity>>> call() async {
    return await citiesRepo.getCities();
  }
}
