import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/auth/data/datasource/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/sign_in_usecase.dart';

final sl = GetIt.instance;

Future<void> diInit() async {
  // External: Register Dio as a lazy singleton.
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data sources: Register the remote data source.
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: sl()));

  // Repositories: Register the auth repository implementation.
  // Note: We register it under the abstract type.
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl()));

  // Use cases: Register the sign-in use case.
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(sl<AuthRepository>()));
}
