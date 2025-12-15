import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/features/auth/data/models/sign_up_response_model/sign_up_response_model.dart';

abstract class SignUpRemoteDataSource {
  Future<Either<Failure, SignUpResponseModel>> signUp({
    required String name,
    required String mobile,
    String? email,
  });
}

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  final ApiService _apiService;

  SignUpRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, SignUpResponseModel>> signUp({
    required String name,
    required String mobile,
    String? email,
  }) async {
    final body = <String, dynamic>{
      'name': name,
      'mobile': mobile,
    };
    
    if (email != null && email.isNotEmpty) {
      body['email'] = email;
    }

    final data = await _apiService.post(
      endpoint: ApiConstants.registerEndpoint,
      body: body,
    );
    return Right(SignUpResponseModel.fromJson(data));
  }
}

