import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/di/dependency_injection.dart';
import 'package:seed/core/routing/app_router.dart';
import 'package:seed/seed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(Seed(appRouter: AppRouter()));
}
