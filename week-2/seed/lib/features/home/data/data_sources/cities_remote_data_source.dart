import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/features/home/data/models/cities_response_model.dart';

abstract class CitiesRemoteDataSource {
  Future<Either<Failure, CitiesResponseModel>> getCities();
}

class CitiesRemoteDataSourceImpl extends CitiesRemoteDataSource {
  final ApiService _apiService;

  CitiesRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, CitiesResponseModel>> getCities() async {
    final data = await _apiService.get(endpoint: ApiConstants.citiesEndpoint);
    return Right(CitiesResponseModel.fromJson(data));
  }
}
