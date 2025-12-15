import 'package:seed/features/auth/domain/entities/change_mobile_response_entity.dart';
import 'package:seed/features/auth/domain/entities/login_response_entity.dart';
import 'package:seed/features/auth/domain/entities/sign_up_response_entity.dart';
import 'package:seed/features/auth/domain/entities/verify_otp_response_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

// Login States
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponseEntity loginResponseEntity;

  AuthSuccess(this.loginResponseEntity);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

// Sign Up States
class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final SignUpResponseEntity signUpResponseEntity;

  SignUpSuccess(this.signUpResponseEntity);
}

class SignUpFailure extends AuthState {
  final String message;

  SignUpFailure(this.message);
}

// Verify OTP States
class VerifyOtpLoading extends AuthState {}

class VerifyOtpSuccess extends AuthState {
  final VerifyOtpResponseEntity verifyOtpResponseEntity;

  VerifyOtpSuccess(this.verifyOtpResponseEntity);
}

class VerifyOtpFailure extends AuthState {
  final String message;

  VerifyOtpFailure(this.message);
}

// Resend OTP States
class ResendOtpLoading extends AuthState {}

class ResendOtpSuccess extends AuthState {}

class ResendOtpFailure extends AuthState {
  final String message;

  ResendOtpFailure(this.message);
}

// Change Mobile States
class ChangeMobileLoading extends AuthState {}

class ChangeMobileSuccess extends AuthState {
  final ChangeMobileResponseEntity changeMobileResponseEntity;

  ChangeMobileSuccess(this.changeMobileResponseEntity);
}

class ChangeMobileFailure extends AuthState {
  final String message;

  ChangeMobileFailure(this.message);
}
