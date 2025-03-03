import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasource/auth_remote_data_source.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';
import 'package:dio/dio.dart';

// Dio instance provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Remote data source provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// Repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
      remoteDataSource: ref.watch(authRemoteDataSourceProvider));
});

// UseCase provider
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

// AuthNotifier provider
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(signInUseCase: ref.watch(signInUseCaseProvider));
});
