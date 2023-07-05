import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_model.freezed.dart';

@freezed
class WeeklyModel with _$WeeklyModel {
  const factory WeeklyModel({
    required List splitList,
    required String splitTitle,
    required String searchQuery,
    required bool weekselector,
    required String? selectedDay,
    required Map<String, int> dateSplitMap,
    // New property for the selected day
  }) = _WeeklyModel;
}
