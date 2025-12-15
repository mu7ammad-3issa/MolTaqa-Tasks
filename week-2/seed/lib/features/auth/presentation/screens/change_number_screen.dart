import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';
import 'package:seed/features/auth/presentation/cubit/login_cubit.dart';
import 'package:seed/features/auth/presentation/widgets/auth_header_with_back.dart';
import 'package:seed/features/auth/presentation/widgets/change_number_bloc_listener.dart';
import 'package:seed/features/auth/presentation/widgets/change_number_form.dart';
import 'package:seed/features/auth/presentation/widgets/change_number_title.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Column(
        children: [
          // Header with logo and back button
          const AuthHeaderWithBack(),
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
                    const ChangeNumberTitle(),
                    verticalSpace(40),
                    const ChangeNumberForm(),
                    verticalSpace(32),
                    AppTextButton(
                      buttonText: 'تأكيد التغيير',
                      textStyle: AppStyles.font14WhiteHeavy,
                      onPressed: () {
                        _validateThenChangeNumber(context);
                      },
                    ),
                    const ChangeNumberBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateThenChangeNumber(BuildContext context) {
    if (context
        .read<AuthCubit>()
        .changeMobileFormKey
        .currentState!
        .validate()) {
      context.read<AuthCubit>().emitChangeMobileStates();
    }
  }
}
