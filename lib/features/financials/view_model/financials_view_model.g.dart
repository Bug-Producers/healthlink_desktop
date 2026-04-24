// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financials_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FinancialsViewModel)
final financialsViewModelProvider = FinancialsViewModelProvider._();

final class FinancialsViewModelProvider
    extends $AsyncNotifierProvider<FinancialsViewModel, RevenueData> {
  FinancialsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'financialsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$financialsViewModelHash();

  @$internal
  @override
  FinancialsViewModel create() => FinancialsViewModel();
}

String _$financialsViewModelHash() =>
    r'40c5670c5c541576b64be7247ecc8c6593d4c8ec';

abstract class _$FinancialsViewModel extends $AsyncNotifier<RevenueData> {
  FutureOr<RevenueData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RevenueData>, RevenueData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueData>, RevenueData>,
              AsyncValue<RevenueData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
