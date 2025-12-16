import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/widgets/loading_dialog.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/auth/presentation/cubit/auth_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpFailure,
      listener: (context, state) {
        if (state is SignUpSuccess) {
          hideLoadingDialog(context);
          final phoneNumber = context
              .read<AuthCubit>()
              .signUpPhoneController
              .text;
          context.pushReplacementNamed(
            Routes.verifyOtpScreen,
            arguments: phoneNumber,
          );
        } else if (state is SignUpFailure) {
          hideLoadingDialog(context);
          _showSnackBar(context, state.message);
        } else if (state is SignUpLoading) {
          showLoadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
