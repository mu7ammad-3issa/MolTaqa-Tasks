import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/widgets/loading_dialog.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/auth/presentation/cubit/auth_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthSuccess ||
          current is AuthFailure,
      listener: (context, state) {
        if (state is AuthSuccess) {
          final phoneNumber = context
              .read<AuthCubit>()
              .loginPhoneController
              .text;
          context.pushReplacementNamed(
            Routes.verifyOtpScreen,
            arguments: phoneNumber,
          );
        } else if (state is AuthFailure) {
          hideLoadingDialog(context);
          _showSnackBar(context, state.message);
        } else {
          showLoadingDialog(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
