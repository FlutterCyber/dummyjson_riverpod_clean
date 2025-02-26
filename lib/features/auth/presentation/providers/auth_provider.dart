// lib/presentation/providers/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final SignInUseCase signInUseCase;

  AuthNotifier({required this.signInUseCase})
      : super(const AsyncValue.data(null));

  Future<void> signIn(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await signInUseCase(username: username, password: password);
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Riverpod provider that retrieves SignInUseCase from get_it.
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final signInUseCase = sl<SignInUseCase>();
  return AuthNotifier(signInUseCase: signInUseCase);
});
