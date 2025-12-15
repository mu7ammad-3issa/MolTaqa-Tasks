import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_constants.dart';
import 'package:seed/core/routing/app_router.dart';
import 'package:seed/core/routing/routes.dart';

class Seed extends StatelessWidget {
  final AppRouter appRouter;
  const Seed({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: isUserLoggedIn ? Routes.mainScreen : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
