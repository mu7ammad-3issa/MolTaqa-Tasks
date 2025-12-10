import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/theming/colors_manager.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: Center(
        child: Text(
          'المزيد',
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: ColorsManager.textPrimary,
          ),
        ),
      ),
    );
  }
}

