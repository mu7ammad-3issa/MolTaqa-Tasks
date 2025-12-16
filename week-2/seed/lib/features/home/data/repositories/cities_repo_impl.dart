import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/home/data/data_sources/cities_remote_data_source.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';
import 'package:seed/features/home/domain/repositories/cities_repo.dart';

class CitiesRepoImpl implements CitiesRepo {
  final CitiesRemoteDataSource _citiesRemoteDataSource;

  CitiesRepoImpl(this._citiesRemoteDataSource);

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    try {
      final response = await _citiesRemoteDataSource.getCities();
      return response.fold(
        (failure) => Left(failure),
        (citiesResponseModel) => Right(citiesResponseModel.data),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
