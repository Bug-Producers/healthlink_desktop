import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/auth_repository.dart';
import '../../../../core/repositories/doctor_repository.dart';

part 'signup_view_model.g.dart';

/// The [SignupViewModel] handles the complex two-stage registration process.
/// 
/// 1. Authentication: Creates a user record in Firebase Auth.
/// 2. Registration: Submits professional details to the HealthLink backend.
@riverpod
class SignupViewModel extends _$SignupViewModel {
  /// Initializes the signup state.
  /// 
  /// @return A [Future] resolving to null as there is no initial data to fetch.
  @override
  FutureOr<void> build() {}

  /// Executes the full registration flow.
  /// 
  /// @param email The doctor's login email.
  /// @param password The doctor's login password.
  /// @param registration The detailed professional [DoctorRegistration] payload.
  /// @return A [Future] that completes when registration is successful.
  /// @throws Exception if either authentication or API registration fails.
  Future<void> signup(String email, String password, DoctorRegistration registration) async {
    final authRepo = ref.read(authRepositoryProvider);
    final doctorRepo = ref.read(doctorRepositoryProvider);

    // Stage 1: Firebase Authentication
    await authRepo.createUser(email, password);
    
    // Stage 2: Backend Professional Registration
    await doctorRepo.register(registration);
  }
}
