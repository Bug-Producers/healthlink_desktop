import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

/// The [AuthRepository] manages the doctor's authentication session through 
/// Firebase. It handles login, registration, and logout operations while 
/// providing a real-time stream of the current session state.
class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  /// Provides a [Stream] that emits the current [User] whenever the 
  /// authentication state changes (e.g., login, logout).
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Returns the currently authenticated Firebase [User], or null if 
  /// no session is active.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Authenticates a doctor using their email and password.
  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Creates a new authentication record in Firebase. This is the first step 
  /// in the registration flow before establishing the professional profile.
  Future<UserCredential> createUser(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Terminates the current authentication session.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance);
}
