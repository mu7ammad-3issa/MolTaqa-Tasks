import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/data/data_sources/sign_up_remote_data_source.dart';
import 'package:seed/features/auth/domain/entities/sign_up_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource _signUpRemoteDataSource;

  SignUpRepoImpl(this._signUpRemoteDataSource);

  @override
  Future<Either<Failure, SignUpResponseEntity>> signUp({
    required String name,
    required String mobile,
    String? email,
  }) async {
    try {
      final response = await _signUpRemoteDataSource.signUp(
        name: name,
        mobile: mobile,
        email: email,
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

