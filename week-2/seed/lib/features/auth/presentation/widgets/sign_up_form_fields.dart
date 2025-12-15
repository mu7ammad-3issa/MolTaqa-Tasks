import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/helpers/helper_methods/validators.dart';
import 'package:seed/core/widgets/app_text_form_field.dart';

class SignUpFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  const SignUpFormFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Name Input Field
        AppTextFormField(
          label: 'الاسم',
          controller: nameController,
          hintText: 'ادخل الاسم',
          textDirection: TextDirection.rtl,
          suffixIcon: SvgPicture.asset(Assets.iconsUser),
          validator: Validators.validateName,
        ),
        verticalSpace(16),

        // Phone Input Field
        AppTextFormField(
          label: 'رقم الجوال',
          controller: phoneController,
          hintText: 'ادخل رقم جوالك',
          textDirection: TextDirection.rtl,
          suffixIcon: SvgPicture.asset(Assets.iconsMobile),
          validator: Validators.validatePhone,
        ),
        verticalSpace(16),

        // Email Input Field
        AppTextFormField(
          label: 'البريد الالكتروني',
          controller: emailController,
          hintText: 'ادخل البريد الالكتروني (اختياري)',
          textDirection: TextDirection.rtl,
          suffixIcon: SvgPicture.asset(Assets.iconsSms),
          validator: Validators.validateOptionalEmail,
        ),
      ],
    );
  }
}
