import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';

abstract class ResendOtpRepo {
  Future<Either<Failure, Unit>> resendOtp();
}
