// lib/domain/usecases/sign_in_usecase.dart
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User> call({required String username, required String password}) {
    return repository.signIn(username: username, password: password);
  }
}
