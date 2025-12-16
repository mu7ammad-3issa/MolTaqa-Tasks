import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/auth/presentation/widgets/already_have_account_text.dart';
import 'package:seed/features/auth/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:seed/features/auth/presentation/widgets/sign_up_form_fields.dart';
import 'package:seed/features/auth/presentation/widgets/sign_up_header.dart';
import 'package:seed/features/auth/presentation/widgets/sign_up_title_section.dart';
import 'package:seed/features/auth/presentation/widgets/terms_checkbox.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SignUpHeader(),
            // sign up form
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: Padding(
                padding: context.symmetric(horizontal: 24.w),
                child: Form(
                  key: context.read<AuthCubit>().signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      verticalSpace(32),
                      const SignUpTitleSection(),
                      verticalSpace(27),
                      SignUpFormFields(
                        nameController: context
                            .read<AuthCubit>()
                            .signUpNameController,
                        phoneController: context
                            .read<AuthCubit>()
                            .signUpPhoneController,
                        emailController: context
                            .read<AuthCubit>()
                            .signUpEmailController,
                      ),
                      verticalSpace(16),
                      TermsCheckbox(
                        isAccepted: _isTermsAccepted,
                        onTap: () {
                          setState(() {
                            _isTermsAccepted = !_isTermsAccepted;
                          });
                        },
                      ),

                      verticalSpace(32),
                      AppTextButton(
                        buttonText: 'انشاء حساب',
                        textStyle: AppStyles.font14WhiteHeavy,
                        onPressed: _validateThenSignUp,
                      ),
                      verticalSpace(8),
                      const AlreadyHaveAccountText(),
                      verticalSpace(40),
                      const SignUpBlocListener(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateThenSignUp() {
    if (context.read<AuthCubit>().signUpFormKey.currentState!.validate()) {
      if (_isTermsAccepted) {
        context.read<AuthCubit>().emitSignUpStates();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'يرجى الموافقة على الشروط والأحكام',
              textDirection: TextDirection.rtl,
            ),
          ),
        );
      }
    }
  }
}
