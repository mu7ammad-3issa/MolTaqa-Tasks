import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_description.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_header.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_input.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_label.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_resend.dart';
import 'package:seed/features/auth/presentation/widgets/verify_otp_title.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final String _phoneNumber = '252 --- --- ---';
  final String _remainingTime = '01:30';

  @override
  void dispose() {
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
          const VerifyOtpHeader(),
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
                      phoneNumber: _phoneNumber,
                      remainingTime: _remainingTime,
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
                    VerifyOtpResend(onResend: _handleResendCode),
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
    debugPrint('OTP Completed: $otp');
    //
  }

  void _handleResendCode() {
    debugPrint('Resend code requested');
    // Handle resend code logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إعادة إرسال الكود', textDirection: TextDirection.rtl),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return AppTextButton(
      buttonText: 'تأكيد',
      onPressed: () {
        final otp = _otpController.text;
        if (otp.length == 4) {
          debugPrint('OTP: $otp');
          // Handle OTP verification logic
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
