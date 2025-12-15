import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/core/helpers/helper_methods/validators.dart';
import 'package:seed/core/widgets/app_text_form_field.dart';
import 'package:seed/features/auth/presentation/cubit/login_cubit.dart';

class ChangeNumberForm extends StatelessWidget {
  const ChangeNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().changeMobileFormKey,
      child: AppTextFormField(
        label: 'رقم الجوال الجديد',
        controller: context.read<AuthCubit>().changeMobileController,
        validator: Validators.validatePhone,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
