// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financials_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$financialsViewModelHash() =>
    r'35e5000e84170073bac8ba9653f1b142ac8ce503';

/// The [FinancialsViewModel] provides the business logic for the Financial Hub.
///
/// It fetches analytical and transactional data in parallel to provide a
/// holistic view of clinical earnings.
///
/// Copied from [FinancialsViewModel].
@ProviderFor(FinancialsViewModel)
final financialsViewModelProvider = AutoDisposeAsyncNotifierProvider<
    FinancialsViewModel, FinancialsData>.internal(
  FinancialsViewModel.new,
  name: r'financialsViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$financialsViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FinancialsViewModel = AutoDisposeAsyncNotifier<FinancialsData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
