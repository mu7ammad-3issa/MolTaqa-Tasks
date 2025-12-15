import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/no_params_use_case.dart';
import 'package:seed/features/auth/domain/repositories/resend_otp_repo.dart';

class ResendOtpUseCase extends NoParamsUseCase<Unit> {
  final ResendOtpRepo resendOtpRepo;

  ResendOtpUseCase(this.resendOtpRepo);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await resendOtpRepo.resendOtp();
  }
}
