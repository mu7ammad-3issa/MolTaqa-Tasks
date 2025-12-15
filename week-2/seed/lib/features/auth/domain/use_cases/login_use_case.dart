import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/use_case.dart';
import 'package:seed/features/auth/domain/entities/login_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/login_repo.dart';

class LoginUseCase extends UseCase<LoginResponseEntity, String> {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(String mobile) async {
    return await loginRepo.login(mobile);
  }
}
