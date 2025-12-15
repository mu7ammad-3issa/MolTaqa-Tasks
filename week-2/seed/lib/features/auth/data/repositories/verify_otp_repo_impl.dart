import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/data/data_sources/verify_otp_remote_data_source.dart';
import 'package:seed/features/auth/domain/entities/verify_otp_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/verify_otp_repo.dart';

class VerifyOtpRepoImpl implements VerifyOtpRepo {
  final VerifyOtpRemoteDataSource _verifyOtpRemoteDataSource;

  VerifyOtpRepoImpl(this._verifyOtpRemoteDataSource);

  @override
  Future<Either<Failure, VerifyOtpResponseEntity>> verifyOtp(
    String code,
  ) async {
    try {
      final response = await _verifyOtpRemoteDataSource.verifyOtp(code);
      return response.fold((failure) => Left(failure), (data) => Right(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
