import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_constants.dart';
import 'package:seed/core/di/dependency_injection.dart';
import 'package:seed/core/helpers/shared_pref_helper.dart';
import 'package:seed/core/routing/app_router.dart';
import 'package:seed/core/helpers/base_extensions/extensions.dart';
import 'package:seed/seed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfUserLoggedIn();
  runApp(Seed(appRouter: AppRouter()));
}

checkIfUserLoggedIn() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.accessToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
