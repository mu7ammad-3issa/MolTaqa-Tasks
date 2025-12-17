import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/home/data/data_sources/advertisements_remote_data_source.dart';
import 'package:seed/features/home/domain/entities/advertisement_entity.dart';
import 'package:seed/features/home/domain/repositories/advertisements_repo.dart';

class AdvertisementsRepoImpl implements AdvertisementsRepo {
  final AdvertisementsRemoteDataSource _advertisementsRemoteDataSource;

  AdvertisementsRepoImpl(this._advertisementsRemoteDataSource);

  @override
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements({
    int? cityId,
  }) async {
    try {
      final response = await _advertisementsRemoteDataSource.getAdvertisements(
        cityId: cityId,
      );
      return response.fold(
        (failure) => Left(failure),
        (advertisementsResponseModel) =>
            Right(advertisementsResponseModel.data),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
