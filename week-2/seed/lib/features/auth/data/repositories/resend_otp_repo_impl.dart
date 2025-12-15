import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/data/data_sources/resend_otp_remote_data_source.dart';
import 'package:seed/features/auth/domain/repositories/resend_otp_repo.dart';

class ResendOtpRepoImpl implements ResendOtpRepo {
  final ResendOtpRemoteDataSource _resendOtpRemoteDataSource;

  ResendOtpRepoImpl(this._resendOtpRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> resendOtp() async {
    try {
      await _resendOtpRemoteDataSource.resendOtp();
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
