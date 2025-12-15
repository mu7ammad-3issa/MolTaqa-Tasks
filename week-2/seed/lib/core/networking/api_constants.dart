import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static const String baseUrl =
      'https://backend.seed.moltaqadev.com/client-api/v1/';
  static const String loginEndpoint = 'auth/login';
  static const String registerEndpoint = 'auth/register';
  static const String verifyOtpEndpoint = 'auth/verify-otp';
  static const String resendOtpEndpoint = 'auth/resend-otp';
  static const String changeMobileEndpoint = 'auth/change-mobile';
  static const String advertisementsEndpoint = 'advertisements';
  static const String citiesEndpoint = 'cities';
}
