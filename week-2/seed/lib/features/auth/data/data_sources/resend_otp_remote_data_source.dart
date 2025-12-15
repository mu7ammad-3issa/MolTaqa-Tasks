import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';

abstract class ResendOtpRemoteDataSource {
  Future<void> resendOtp();
}

class ResendOtpRemoteDataSourceImpl extends ResendOtpRemoteDataSource {
  final ApiService _apiService;

  ResendOtpRemoteDataSourceImpl(this._apiService);

  @override
  Future<void> resendOtp() async {
    await _apiService.post(endpoint: ApiConstants.resendOtpEndpoint);
  }
}
