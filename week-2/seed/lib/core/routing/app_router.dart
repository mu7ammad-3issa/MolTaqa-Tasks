import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed/core/di/dependency_injection.dart';
import 'package:seed/core/routing/routes.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/auth/presentation/screens/change_number_screen.dart';
import 'package:seed/features/auth/presentation/screens/login_screen.dart';
import 'package:seed/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:seed/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:seed/features/home/presentation/cubit/cities_cubit.dart';
import 'package:seed/features/home/presentation/screens/all_projects_screen.dart';
import 'package:seed/features/home/presentation/screens/home_screen.dart';
import 'package:seed/features/main/presentation/main_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed to any screen like this {arguments as className}
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpScreen(),
          ),
          settings: settings,
        );
      case Routes.verifyOtpScreen:
        final phoneNumber = arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: VerifyOtpScreen(phoneNumber: phoneNumber),
          ),
          settings: settings,
        );
      case Routes.changeNumberScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const ChangeNumberScreen(),
          ),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CitiesCubit>(),
            child: const HomeScreen(),
          ),
          settings: settings,
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CitiesCubit>(),
            child: const MainScreen(),
          ),
          settings: settings,
        );
      case Routes.allProjectsScreen:
        return MaterialPageRoute(
          builder: (_) => const AllProjectsScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
