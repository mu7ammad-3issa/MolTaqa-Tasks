import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/widgets/loading_dialog.dart';
import 'package:seed/features/auth/presentation/cubit/login_cubit.dart';
import 'package:seed/features/auth/presentation/cubit/login_state.dart';

class ChangeNumberBlocListener extends StatelessWidget {
  const ChangeNumberBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is ChangeMobileLoading ||
          current is ChangeMobileSuccess ||
          current is ChangeMobileFailure,
      listener: (context, state) {
        if (state is ChangeMobileSuccess) {
          hideLoadingDialog(context);
          final phoneNumber = context
              .read<AuthCubit>()
              .changeMobileController
              .text;
          context.pushReplacementNamed(
            Routes.verifyOtpScreen,
            arguments: phoneNumber,
          );
        } else if (state is ChangeMobileFailure) {
          hideLoadingDialog(context);
          _showSnackBar(context, state.message);
        } else {
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
