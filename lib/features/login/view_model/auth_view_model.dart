import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/repositories/auth_repository.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  Stream<User?> build() {
    final repository = ref.watch(authRepositoryProvider);
    return repository.authStateChanges;
  }

  Future<void> login(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signIn(email, password);
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signOut();
  }

  /// Sends a password reset email via Firebase.
  ///
  /// @param email The email address to send the reset link to.
  Future<void> resetPassword(String email) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.sendPasswordReset(email);
  }
}
