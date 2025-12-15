import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/features/auth/data/models/verify_otp_response_model.dart';

abstract class VerifyOtpRemoteDataSource {
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(String code);
}

class VerifyOtpRemoteDataSourceImpl extends VerifyOtpRemoteDataSource {
  final ApiService _apiService;

  VerifyOtpRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(String code) async {
    final data = await _apiService.post(
      endpoint: ApiConstants.verifyOtpEndpoint,
      body: {'code': code},
    );
    return Right(VerifyOtpResponseModel.fromJson(data));
  }
}
