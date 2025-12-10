import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/theming/font_weight_helper.dart';

class AppStyles {
  static String fontFamily = 'Avenir';
  // Heading styles
  static TextStyle font24PrimaryHeavy = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.heavy,
    color: ColorsManager.primary,
  );

  static TextStyle font18SecondaryMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textSecondary,
  );

  static TextStyle font16TextPrimaryHeavy = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.heavy,
    color: ColorsManager.textPrimary,
  );

  // Body text styles
  static TextStyle font16TextPrimaryMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font14TextSecondaryMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textSecondary,
  );

  static TextStyle font14TextPrimaryRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font14TextPrimaryLight = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.textPrimary,
  );
  static TextStyle font20TextPrimaryMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textPrimary,
  );
  static TextStyle font14PrimaryLight = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.primary,
  );

  static TextStyle font14PrimaryHeavy = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.heavy,
    color: ColorsManager.primary,
  );

  static TextStyle font14WhiteHeavy = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.heavy,
    color: ColorsManager.white,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textSecondary,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font12TextSecondaryLight = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.textSecondary,
  );
}

class TextStyles {
  // Aliases for backward compatibility
  static TextStyle get font14LightGrayRegular =>
      AppStyles.font14LightGrayRegular;
  static TextStyle get font14DarkBlueMedium => AppStyles.font14DarkBlueMedium;
}
