import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';

part 'ratings_view_model.g.dart';

/// The [RatingsViewModel] facilitates the retrieval and management of doctor 
/// feedback and overall satisfaction metrics.
@riverpod
class RatingsViewModel extends _$RatingsViewModel {
  /// Fetches the current ratings distribution and review history.
  /// 
  /// @return A [Future] resolving to the [RatingsData].
  @override
  Future<RatingsData> build() async {
    final repository = ref.watch(doctorRepositoryProvider);
    return repository.getRatings();
  }

  /// Triggers a refresh of the ratings data.
  void refresh() {
    ref.invalidateSelf();
  }
}
