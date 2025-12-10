import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/theming/colors_manager.dart';

class VerifyOtpHeader extends StatelessWidget {
  const VerifyOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // logo
        SizedBox(
          width: 174.w,
          height: 207.h,
          child: Image.asset(Assets.imagesLoginLogoWithBackground),
        ),
        // Back button
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: context.pop,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.white,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
