import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/features/home/data/models/advertisements_response_model/advertisements_response_model.dart';

abstract class AdvertisementsRemoteDataSource {
  Future<Either<Failure, AdvertisementsResponseModel>> getAdvertisements({
    int? cityId,
  });
}

class AdvertisementsRemoteDataSourceImpl
    extends AdvertisementsRemoteDataSource {
  final ApiService _apiService;

  AdvertisementsRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, AdvertisementsResponseModel>> getAdvertisements({
    int? cityId,
  }) async {
    final queryParams = <String, dynamic>{};
    if (cityId != null) {
      queryParams['cityId'] = cityId;
    }

    final data = await _apiService.get(
      endpoint: ApiConstants.advertisementsEndpoint,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    return Right(AdvertisementsResponseModel.fromJson(data));
  }
}
