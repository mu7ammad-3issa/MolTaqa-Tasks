import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/domain/entities/login_response_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponseEntity>> login(String mobile);
}
