import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/data/data_sources/change_mobile_remote_data_source.dart';
import 'package:seed/features/auth/domain/entities/change_mobile_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/change_mobile_repo.dart';

class ChangeMobileRepoImpl implements ChangeMobileRepo {
  final ChangeMobileRemoteDataSource _changeMobileRemoteDataSource;

  ChangeMobileRepoImpl(this._changeMobileRemoteDataSource);

  @override
  Future<Either<Failure, ChangeMobileResponseEntity>> changeMobile({
    required String mobile,
  }) async {
    try {
      final response = await _changeMobileRemoteDataSource.changeMobile(
        mobile: mobile,
      );
      return response.fold((failure) => Left(failure), (data) => Right(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
