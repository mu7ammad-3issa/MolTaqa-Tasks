import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/use_case.dart';
import 'package:seed/features/auth/domain/entities/sign_up_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/sign_up_repo.dart';

class SignUpParams {
  final String name;
  final String mobile;
  final String? email;

  SignUpParams({
    required this.name,
    required this.mobile,
    this.email,
  });
}

class SignUpUseCase extends UseCase<SignUpResponseEntity, SignUpParams> {
  final SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  @override
  Future<Either<Failure, SignUpResponseEntity>> call(SignUpParams params) async {
    return await signUpRepo.signUp(
      name: params.name,
      mobile: params.mobile,
      email: params.email,
    );
  }
}

