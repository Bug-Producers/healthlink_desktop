// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScheduleViewModel)
final scheduleViewModelProvider = ScheduleViewModelProvider._();

final class ScheduleViewModelProvider
    extends $AsyncNotifierProvider<ScheduleViewModel, DoctorSchedule> {
  ScheduleViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleViewModelHash();

  @$internal
  @override
  ScheduleViewModel create() => ScheduleViewModel();
}

String _$scheduleViewModelHash() => r'305efd6a4f672935eb051009f840c7face9e5998';

abstract class _$ScheduleViewModel extends $AsyncNotifier<DoctorSchedule> {
  FutureOr<DoctorSchedule> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DoctorSchedule>, DoctorSchedule>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DoctorSchedule>, DoctorSchedule>,
              AsyncValue<DoctorSchedule>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
