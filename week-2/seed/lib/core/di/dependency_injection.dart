import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:seed/core/networking/api_constants.dart';
import 'package:seed/core/networking/api_service.dart';
import 'package:seed/core/networking/dio_factory.dart';
import 'package:seed/features/auth/data/data_sources/change_mobile_remote_data_source.dart';
import 'package:seed/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:seed/features/auth/data/data_sources/resend_otp_remote_data_source.dart';
import 'package:seed/features/auth/data/data_sources/sign_up_remote_data_source.dart';
import 'package:seed/features/auth/data/data_sources/verify_otp_remote_data_source.dart';
import 'package:seed/features/auth/data/repositories/change_mobile_repo_impl.dart';
import 'package:seed/features/auth/data/repositories/login_repo_impl.dart';
import 'package:seed/features/auth/data/repositories/resend_otp_repo_impl.dart';
import 'package:seed/features/auth/data/repositories/sign_up_repo_impl.dart';
import 'package:seed/features/auth/data/repositories/verify_otp_repo_impl.dart';
import 'package:seed/features/auth/domain/repositories/change_mobile_repo.dart';
import 'package:seed/features/auth/domain/repositories/login_repo.dart';
import 'package:seed/features/auth/domain/repositories/resend_otp_repo.dart';
import 'package:seed/features/auth/domain/repositories/sign_up_repo.dart';
import 'package:seed/features/auth/domain/repositories/verify_otp_repo.dart';
import 'package:seed/features/auth/domain/use_cases/change_mobile_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:seed/features/auth/domain/use_cases/verify_otp_use_case.dart';
import 'package:seed/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:seed/features/home/data/data_sources/advertisements_remote_data_source.dart';
import 'package:seed/features/home/data/data_sources/cities_remote_data_source.dart';
import 'package:seed/features/home/data/repositories/advertisements_repo_impl.dart';
import 'package:seed/features/home/data/repositories/cities_repo_impl.dart';
import 'package:seed/features/home/domain/repositories/advertisements_repo.dart';
import 'package:seed/features/home/domain/repositories/cities_repo.dart';
import 'package:seed/features/home/domain/use_cases/get_advertisements_use_case.dart';
import 'package:seed/features/home/domain/use_cases/get_cities_use_case.dart';
import 'package:seed/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio: dio, baseUrl: ApiConstants.baseUrl),
  );

  // Auth Data layer - Login
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt<LoginRemoteDataSource>()),
  );

  // Auth Data layer - Sign Up
  getIt.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(getIt<SignUpRemoteDataSource>()),
  );

  // Auth Data layer - Verify OTP
  getIt.registerLazySingleton<VerifyOtpRemoteDataSource>(
    () => VerifyOtpRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<VerifyOtpRepo>(
    () => VerifyOtpRepoImpl(getIt<VerifyOtpRemoteDataSource>()),
  );

  // Auth Data layer - Resend OTP
  getIt.registerLazySingleton<ResendOtpRemoteDataSource>(
    () => ResendOtpRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ResendOtpRepo>(
    () => ResendOtpRepoImpl(getIt<ResendOtpRemoteDataSource>()),
  );

  // Auth Data layer - Change Mobile
  getIt.registerLazySingleton<ChangeMobileRemoteDataSource>(
    () => ChangeMobileRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ChangeMobileRepo>(
    () => ChangeMobileRepoImpl(getIt<ChangeMobileRemoteDataSource>()),
  );

  // Auth Domain layer
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<LoginRepo>()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<SignUpRepo>()),
  );
  getIt.registerLazySingleton<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(getIt<VerifyOtpRepo>()),
  );
  getIt.registerLazySingleton<ResendOtpUseCase>(
    () => ResendOtpUseCase(getIt<ResendOtpRepo>()),
  );
  getIt.registerLazySingleton<ChangeMobileUseCase>(
    () => ChangeMobileUseCase(getIt<ChangeMobileRepo>()),
  );

  // Auth Presentation layer
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      getIt<LoginUseCase>(),
      getIt<VerifyOtpUseCase>(),
      getIt<ResendOtpUseCase>(),
      getIt<SignUpUseCase>(),
      getIt<ChangeMobileUseCase>(),
    ),
  );

  // Home Data layer - Cities
  getIt.registerLazySingleton<CitiesRemoteDataSource>(
    () => CitiesRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CitiesRepo>(
    () => CitiesRepoImpl(getIt<CitiesRemoteDataSource>()),
  );

  // Home Domain layer - Cities
  getIt.registerLazySingleton<GetCitiesUseCase>(
    () => GetCitiesUseCase(getIt<CitiesRepo>()),
  );

  // Home Data layer - Advertisements
  getIt.registerLazySingleton<AdvertisementsRemoteDataSource>(
    () => AdvertisementsRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AdvertisementsRepo>(
    () => AdvertisementsRepoImpl(getIt<AdvertisementsRemoteDataSource>()),
  );

  // Home Domain layer - Advertisements
  getIt.registerLazySingleton<GetAdvertisementsUseCase>(
    () => GetAdvertisementsUseCase(getIt<AdvertisementsRepo>()),
  );

  // Home Presentation layer
  getIt.registerFactory<HomeCubit>(
    () =>
        HomeCubit(getIt<GetCitiesUseCase>(), getIt<GetAdvertisementsUseCase>()),
  );
}
