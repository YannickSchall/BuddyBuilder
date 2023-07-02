// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'new_split_model.freezed.dart';

@freezed
class NewSplitModel with _$NewSplitModel {
  const factory NewSplitModel({
    required List workoutList,
    required String workoutTitle,
    required List widgetList,
    required int setId,
  }) = _NewSplitModel;
}
