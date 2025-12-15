import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/features/auth/data/models/change_mobile_response_model/change_mobile_response_model.dart';

abstract class ChangeMobileRemoteDataSource {
  Future<Either<Failure, ChangeMobileResponseModel>> changeMobile({
    required String mobile,
  });
}

class ChangeMobileRemoteDataSourceImpl extends ChangeMobileRemoteDataSource {
  final ApiService _apiService;

  ChangeMobileRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, ChangeMobileResponseModel>> changeMobile({
    required String mobile,
  }) async {
    final body = <String, dynamic>{'mobile': mobile};

    final data = await _apiService.post(
      endpoint: ApiConstants.changeMobileEndpoint,
      body: body,
    );
    return Right(ChangeMobileResponseModel.fromJson(data));
  }
}
