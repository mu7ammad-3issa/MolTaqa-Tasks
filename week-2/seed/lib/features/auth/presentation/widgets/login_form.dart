import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/core/helpers/helper_methods/validators.dart';
import 'package:seed/core/widgets/app_text_form_field.dart';
import 'package:seed/features/auth/presentation/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().loginFormKey,
      child: AppTextFormField(
        label: 'رقم الجوال',
        controller: context.read<AuthCubit>().loginPhoneController,
        validator: Validators.validatePhone,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
