// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'training_model.freezed.dart';

@freezed
class TrainingModel with _$TrainingModel {
  const factory TrainingModel() = _TrainingModel;
}