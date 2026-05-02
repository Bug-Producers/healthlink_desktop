// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signupViewModelHash() => r'8c9159912efca218cceb2da0b4792dbe601017bf';

/// The [SignupViewModel] handles the complex two-stage registration process.
///
/// 1. Authentication: Creates a user record in Firebase Auth.
/// 2. Registration: Submits professional details to the HealthLink backend.
///
/// Copied from [SignupViewModel].
@ProviderFor(SignupViewModel)
final signupViewModelProvider =
    AutoDisposeAsyncNotifierProvider<SignupViewModel, void>.internal(
  SignupViewModel.new,
  name: r'signupViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signupViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignupViewModel = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
