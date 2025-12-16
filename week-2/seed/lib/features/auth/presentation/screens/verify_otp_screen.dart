import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_constants.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_bloc_listener.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_description.dart';
import 'package:seed/features/auth/presentation/widgets/auth_header_with_back.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_input.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_label.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_resend.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_title.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifyOtpScreen({super.key, required this.phoneNumber});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = resendCodeTime; // 1:30 in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String get _formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Column(
        children: [
          // Header with logo and back button
          const AuthHeaderWithBack(),
          // Main content card
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: context.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    verticalSpace(32),
                    const VerifyOtpTitle(),
                    verticalSpace(24),
                    VerifyOtpDescription(
                      phoneNumber: widget.phoneNumber,
                      remainingTime: _formattedTime,
                      onChangeNumber: () => _handleChangeNumber(),
                    ),
                    verticalSpace(40),
                    const VerifyOtpLabel(),
                    verticalSpace(8),
                    VerifyOtpInput(
                      controller: _otpController,
                      onCompleted: _handleOtpCompleted,
                    ),
                    verticalSpace(32),
                    _buildConfirmButton(),
                    verticalSpace(8),
                    VerifyOtpResend(
                      onResend: _handleResendCode,
                      isEnabled: _remainingSeconds == 0,
                    ),
                    VerifyOtpBlocListener(onResendOtpSuccess: _resetTimer),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleOtpCompleted(String otp) {
    context.read<AuthCubit>().emitVerifyOtpStates(otp);
  }

  void _handleResendCode() {
    context.read<AuthCubit>().emitResendOtpStates();
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = resendCodeTime;
    });
    _startTimer();
  }

  void _handleChangeNumber() {
    context.pushNamed(Routes.changeNumberScreen);
  }

  Widget _buildConfirmButton() {
    return AppTextButton(
      buttonText: 'تأكيد',
      onPressed: () {
        final otp = _otpController.text;
        if (otp.length == 4) {
          context.read<AuthCubit>().emitVerifyOtpStates(otp);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'يرجى إدخال الكود المكون من 4 أرقام',
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        }
      },
      textStyle: AppStyles.font14WhiteHeavy,
    );
  }
}
