import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/domain/entities/sign_up_response_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpResponseEntity>> signUp({
    required String name,
    required String mobile,
    String? email,
  });
}

