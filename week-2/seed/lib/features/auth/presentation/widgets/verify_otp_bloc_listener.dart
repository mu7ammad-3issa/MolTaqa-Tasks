import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/widgets/loading_dialog.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/auth/presentation/cubit/auth_state.dart';

class VerifyOtpBlocListener extends StatelessWidget {
  final VoidCallback? onResendOtpSuccess;

  const VerifyOtpBlocListener({super.key, this.onResendOtpSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is VerifyOtpLoading ||
          current is VerifyOtpSuccess ||
          current is VerifyOtpFailure ||
          current is ResendOtpLoading ||
          current is ResendOtpSuccess ||
          current is ResendOtpFailure ||
          current is ChangeMobileLoading ||
          current is ChangeMobileSuccess ||
          current is ChangeMobileFailure,
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          hideLoadingDialog(context);
          _showSuccessSnackBar(context, state.verifyOtpResponseEntity.message);
          context.pushNamedAndRemoveUntil(
            Routes.mainScreen,
            predicate: (route) => false,
          );
        } else if (state is VerifyOtpFailure) {
          hideLoadingDialog(context);
          _showErrorSnackBar(context, state.message);
        } else if (state is VerifyOtpLoading) {
          showLoadingDialog(context);
        } else if (state is ResendOtpSuccess) {
          hideLoadingDialog(context);
          _showSuccessSnackBar(context, 'تم إعادة إرسال الكود بنجاح');
          onResendOtpSuccess?.call();
        } else if (state is ResendOtpFailure) {
          hideLoadingDialog(context);
          _showErrorSnackBar(context, state.message);
        } else if (state is ResendOtpLoading) {
          showLoadingDialog(context);
        } else if (state is ChangeMobileSuccess) {
          hideLoadingDialog(context);
          _showSuccessSnackBar(context, 'تم تغيير رقم الهاتف بنجاح');
          context.pop(); // Go back to login screen
        } else if (state is ChangeMobileFailure) {
          hideLoadingDialog(context);
          _showErrorSnackBar(context, state.message);
        } else if (state is ChangeMobileLoading) {
          showLoadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

void _showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textDirection: TextDirection.rtl),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),
  );
}

void _showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textDirection: TextDirection.rtl),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),
  );
}
