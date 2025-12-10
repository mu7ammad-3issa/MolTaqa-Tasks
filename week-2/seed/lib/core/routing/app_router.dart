import 'package:flutter/material.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/features/auth/presentation/screens/login_screen.dart';
import 'package:seed/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:seed/features/auth/presentation/screens/verify_otp_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed to any screen like this {arguments as className}
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );
      case Routes.verifyOtpScreen:
        return MaterialPageRoute(
          builder: (_) => const VerifyOtpScreen(),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
