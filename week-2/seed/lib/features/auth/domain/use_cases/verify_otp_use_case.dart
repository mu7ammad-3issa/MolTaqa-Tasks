import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/use_case.dart';
import 'package:seed/features/auth/domain/entities/verify_otp_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/verify_otp_repo.dart';

class VerifyOtpUseCase extends UseCase<VerifyOtpResponseEntity, String> {
  final VerifyOtpRepo verifyOtpRepo;

  VerifyOtpUseCase(this.verifyOtpRepo);

  @override
  Future<Either<Failure, VerifyOtpResponseEntity>> call(String code) async {
    return await verifyOtpRepo.verifyOtp(code);
  }
}
