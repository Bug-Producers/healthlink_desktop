// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardViewModel)
final dashboardViewModelProvider = DashboardViewModelProvider._();

final class DashboardViewModelProvider
    extends $AsyncNotifierProvider<DashboardViewModel, DoctorProfile> {
  DashboardViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardViewModelHash();

  @$internal
  @override
  DashboardViewModel create() => DashboardViewModel();
}

String _$dashboardViewModelHash() =>
    r'52e65d1f5e9949c2575fbd5d96a83734f75825ab';

abstract class _$DashboardViewModel extends $AsyncNotifier<DoctorProfile> {
  FutureOr<DoctorProfile> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DoctorProfile>, DoctorProfile>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DoctorProfile>, DoctorProfile>,
              AsyncValue<DoctorProfile>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
