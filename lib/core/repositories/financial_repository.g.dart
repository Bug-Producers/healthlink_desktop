// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(financialRepository)
final financialRepositoryProvider = FinancialRepositoryProvider._();

final class FinancialRepositoryProvider
    extends
        $FunctionalProvider<
          FinancialRepository,
          FinancialRepository,
          FinancialRepository
        >
    with $Provider<FinancialRepository> {
  FinancialRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'financialRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$financialRepositoryHash();

  @$internal
  @override
  $ProviderElement<FinancialRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FinancialRepository create(Ref ref) {
    return financialRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FinancialRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FinancialRepository>(value),
    );
  }
}

String _$financialRepositoryHash() =>
    r'8d09d621368806e0fe03aa9b997a74907d282332';
