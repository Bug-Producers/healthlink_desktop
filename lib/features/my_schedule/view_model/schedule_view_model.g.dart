// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleViewModelHash() => r'2b51e5aefb400a1d924a07a269f01aa2ee2a623b';

/// The [ScheduleViewModel] manages the doctor's weekly availability state.
///
/// It coordinates between the schedule UI and the [DoctorRepository] to
/// fetch, display, and update active time slots.
///
/// Copied from [ScheduleViewModel].
@ProviderFor(ScheduleViewModel)
final scheduleViewModelProvider = AutoDisposeAsyncNotifierProvider<
    ScheduleViewModel, DoctorSchedule>.internal(
  ScheduleViewModel.new,
  name: r'scheduleViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleViewModel = AutoDisposeAsyncNotifier<DoctorSchedule>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
