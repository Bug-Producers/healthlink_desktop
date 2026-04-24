// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppointmentsViewModel)
final appointmentsViewModelProvider = AppointmentsViewModelProvider._();

final class AppointmentsViewModelProvider
    extends $AsyncNotifierProvider<AppointmentsViewModel, List<Appointment>> {
  AppointmentsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentsViewModelHash();

  @$internal
  @override
  AppointmentsViewModel create() => AppointmentsViewModel();
}

String _$appointmentsViewModelHash() =>
    r'80fc890175c30a59f00231673aa0a61c38f6ddb1';

abstract class _$AppointmentsViewModel
    extends $AsyncNotifier<List<Appointment>> {
  FutureOr<List<Appointment>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Appointment>>, List<Appointment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Appointment>>, List<Appointment>>,
              AsyncValue<List<Appointment>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
