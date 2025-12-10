import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/helpers/helper_methods/validators.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';
import 'package:seed/core/widgets/app_text_form_field.dart';
import 'package:seed/features/auth/presentation/widgets/login_welcome_text.dart';
import 'package:seed/features/auth/presentation/widgets/sign_up_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

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
                    AppTextFormField(
                      label: 'رقم الجوال',
                      controller: _phoneController,
                      validator: Validators.validatePhone,
                      textDirection: TextDirection.rtl,
                    ),
                    verticalSpace(32),
                    AppTextButton(
                      buttonText: 'تسجيل الدخول',
                      textStyle: AppStyles.font14WhiteHeavy,
                      onPressed: () {
                        context.pushNamed(Routes.homeScreen);
                      },
                    ),
                    verticalSpace(8),
                    SignUpText(),
                    verticalSpace(140),
                    AppTextButton(
                      buttonText: 'الدخول كزائر',
                      textStyle: AppStyles.font14PrimaryHeavy,
                      onPressed: () {
                        // Handle guest login
                      },
                      backgroundColor: ColorsManager.white,
                      // borderColor: ColorsManager.primary,
                    ),
                    verticalSpace(32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
