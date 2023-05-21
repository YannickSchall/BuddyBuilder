// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'home_page_model.freezed.dart';

@freezed
class HomePageModel with _$HomePageModel {
  const factory HomePageModel({
    required bool switchTree,
  }) = _HomePageModel;

}