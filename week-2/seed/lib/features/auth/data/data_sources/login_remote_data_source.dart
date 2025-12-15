import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/features/auth/data/models/login_response_model/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginResponseModel>> login(String mobile);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, LoginResponseModel>> login(String mobile) async {
    final data = await _apiService.post(
      endpoint: ApiConstants.loginEndpoint,
      body: {'mobile': mobile},
    );
    return Right(LoginResponseModel.fromJson(data));
  }
}
