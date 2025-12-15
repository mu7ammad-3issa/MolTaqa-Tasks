import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/domain/entities/verify_otp_response_entity.dart';

abstract class VerifyOtpRepo {
  Future<Either<Failure, VerifyOtpResponseEntity>> verifyOtp(String code);
}
