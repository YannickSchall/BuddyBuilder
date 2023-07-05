import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_model.freezed.dart';

@freezed
class WeeklyModel with _$WeeklyModel {
  const factory WeeklyModel({
    required List splits,
    required String query,
    required bool weekselector,
    required String? selectedDay, // New property for the selected day
  }) = _WeeklyModel;
}
