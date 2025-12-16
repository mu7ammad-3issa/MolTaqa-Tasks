import 'package:flutter/material.dart';
import 'package:seed/core/constants/app_constants.dart';
import 'package:seed/core/helpers/shared_pref_helper.dart';
import 'package:seed/core/networking/dio_factory.dart';
import 'package:seed/features/auth/domain/use_cases/change_mobile_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/verify_otp_use_case.dart';
import 'package:seed/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ResendOtpUseCase resendOtpUseCase;
  final SignUpUseCase signUpUseCase;
  final ChangeMobileUseCase changeMobileUseCase;

  AuthCubit(
    this.loginUseCase,
    this.verifyOtpUseCase,
    this.resendOtpUseCase,
    this.signUpUseCase,
    this.changeMobileUseCase,
  ) : super(AuthInitial());

  // Login controllers
  TextEditingController loginPhoneController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  // Sign Up controllers
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();

  // Change Mobile controllers
  TextEditingController changeMobileController = TextEditingController();
  final changeMobileFormKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    emit(AuthLoading());
    final result = await loginUseCase(loginPhoneController.text);
    result.fold((failure) => emit(AuthFailure(failure.message)), (response) {
      saveAccessToken(response.token);
      emit(AuthSuccess(response));
    });
  }

  Future<void> emitSignUpStates() async {
    emit(SignUpLoading());
    final result = await signUpUseCase(
      SignUpParams(
        name: signUpNameController.text,
        mobile: signUpPhoneController.text,
        email: signUpEmailController.text.isNotEmpty
            ? signUpEmailController.text
            : null,
      ),
    );
    result.fold((failure) => emit(SignUpFailure(failure.message)), (response) {
      saveAccessToken(response.accessToken);
      emit(SignUpSuccess(response));
    });
  }

  Future<void> emitVerifyOtpStates(String code) async {
    emit(VerifyOtpLoading());
    final result = await verifyOtpUseCase(code);
    result.fold(
      (failure) => emit(VerifyOtpFailure(failure.message)),
      (response) => emit(VerifyOtpSuccess(response)),
    );
  }

  Future<void> emitResendOtpStates() async {
    emit(ResendOtpLoading());
    final result = await resendOtpUseCase();
    result.fold(
      (failure) => emit(ResendOtpFailure(failure.message)),
      (_) => emit(ResendOtpSuccess()),
    );
  }

  Future<void> emitChangeMobileStates() async {
    emit(ChangeMobileLoading());
    final result = await changeMobileUseCase(changeMobileController.text);
    result.fold((failure) => emit(ChangeMobileFailure(failure.message)), (
      response,
    ) {
      saveAccessToken(response.accessToken);
      emit(ChangeMobileSuccess(response));
    });
  }
}

Future<void> saveAccessToken(String token) async {
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.accessToken, token);
  DioFactory.setTokenIntoHeaderAfterLogin(token);
}
