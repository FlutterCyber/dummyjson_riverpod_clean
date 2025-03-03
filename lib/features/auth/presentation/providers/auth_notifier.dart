import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase signInUseCase;

  AuthNotifier({required this.signInUseCase}) : super(AuthInitial());

  Future<void> signIn(String username, String password) async {
    try {
      state = AuthLoading();
      final user = await signInUseCase(username: username, password: password);
      state = AuthSuccess(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }
}
