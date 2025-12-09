import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174.w,
      height: 207.h,
      child: Image.asset(Assets.imagesLoginLogoWithBackground),
    );
  }
}
