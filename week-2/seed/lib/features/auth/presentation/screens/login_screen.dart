import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';
import 'package:seed/features/auth/presentation/widgets/dont_have_account_text.dart';
import 'package:seed/features/auth/presentation/widgets/login_bloc_listener.dart';
import 'package:seed/features/auth/presentation/widgets/login_form.dart';
import 'package:seed/features/auth/presentation/widgets/login_welcome_text.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Column(
        children: [
          // Logo section
          SizedBox(
            width: 174.w,
            height: 207.h,
            child: Image.asset(Assets.imagesLoginLogoWithBackground),
          ),
          // White card section
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
                    LoginWelcomeText(),
                    verticalSpace(40),
                    LoginForm(),
                    verticalSpace(32),
                    AppTextButton(
                      buttonText: 'تسجيل الدخول',

                      textStyle: AppStyles.font14WhiteHeavy,
                      onPressed: () {
                        _validateThenLogin(context);
                      },
                    ),
                    verticalSpace(8),
                    DontHaveAccountText(),
                    verticalSpace(140),
                    AppTextButton(
                      buttonText: 'الدخول كزائر',
                      textStyle: AppStyles.font14PrimaryHeavy,
                      onPressed: () {
                        context.pushReplacementNamed(Routes.mainScreen);
                      },
                      backgroundColor: ColorsManager.white,
                      // borderColor: ColorsManager.primary,
                    ),
                    verticalSpace(32),
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateThenLogin(BuildContext context) {
    if (context.read<AuthCubit>().loginFormKey.currentState!.validate()) {
      context.read<AuthCubit>().emitLoginStates();
    }
  }
}
