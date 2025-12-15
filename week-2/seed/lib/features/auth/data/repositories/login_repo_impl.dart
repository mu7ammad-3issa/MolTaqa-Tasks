import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:seed/features/auth/domain/entities/login_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;
  LoginRepoImpl(this._loginRemoteDataSource);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(String mobile) async {
    try {
      final response = await _loginRemoteDataSource.login(mobile);
      return response.fold((failure) => Left(failure), (data) => Right(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
