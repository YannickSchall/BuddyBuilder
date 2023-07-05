// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeeklyModel {
  List<dynamic> get splits => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  bool get weekselector => throw _privateConstructorUsedError;
  String? get selectedDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeeklyModelCopyWith<WeeklyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyModelCopyWith<$Res> {
  factory $WeeklyModelCopyWith(
          WeeklyModel value, $Res Function(WeeklyModel) then) =
      _$WeeklyModelCopyWithImpl<$Res, WeeklyModel>;
  @useResult
  $Res call(
      {List<dynamic> splits,
      String query,
      bool weekselector,
      String? selectedDay});
}

/// @nodoc
class _$WeeklyModelCopyWithImpl<$Res, $Val extends WeeklyModel>
    implements $WeeklyModelCopyWith<$Res> {
  _$WeeklyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splits = null,
    Object? query = null,
    Object? weekselector = null,
    Object? selectedDay = freezed,
  }) {
    return _then(_value.copyWith(
      splits: null == splits
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      weekselector: null == weekselector
          ? _value.weekselector
          : weekselector // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeeklyModelCopyWith<$Res>
    implements $WeeklyModelCopyWith<$Res> {
  factory _$$_WeeklyModelCopyWith(
          _$_WeeklyModel value, $Res Function(_$_WeeklyModel) then) =
      __$$_WeeklyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> splits,
      String query,
      bool weekselector,
      String? selectedDay});
}

/// @nodoc
class __$$_WeeklyModelCopyWithImpl<$Res>
    extends _$WeeklyModelCopyWithImpl<$Res, _$_WeeklyModel>
    implements _$$_WeeklyModelCopyWith<$Res> {
  __$$_WeeklyModelCopyWithImpl(
      _$_WeeklyModel _value, $Res Function(_$_WeeklyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splits = null,
    Object? query = null,
    Object? weekselector = null,
    Object? selectedDay = freezed,
  }) {
    return _then(_$_WeeklyModel(
      splits: null == splits
          ? _value._splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      weekselector: null == weekselector
          ? _value.weekselector
          : weekselector // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_WeeklyModel implements _WeeklyModel {
  const _$_WeeklyModel(
      {required final List<dynamic> splits,
      required this.query,
      required this.weekselector,
      required this.selectedDay})
      : _splits = splits;

  final List<dynamic> _splits;
  @override
  List<dynamic> get splits {
    if (_splits is EqualUnmodifiableListView) return _splits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splits);
  }

  @override
  final String query;
  @override
  final bool weekselector;
  @override
  final String? selectedDay;

  @override
  String toString() {
    return 'WeeklyModel(splits: $splits, query: $query, weekselector: $weekselector, selectedDay: $selectedDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeeklyModel &&
            const DeepCollectionEquality().equals(other._splits, _splits) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.weekselector, weekselector) ||
                other.weekselector == weekselector) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_splits),
      query,
      weekselector,
      selectedDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeeklyModelCopyWith<_$_WeeklyModel> get copyWith =>
      __$$_WeeklyModelCopyWithImpl<_$_WeeklyModel>(this, _$identity);
}

abstract class _WeeklyModel implements WeeklyModel {
  const factory _WeeklyModel(
      {required final List<dynamic> splits,
      required final String query,
      required final bool weekselector,
      required final String? selectedDay}) = _$_WeeklyModel;

  @override
  List<dynamic> get splits;
  @override
  String get query;
  @override
  bool get weekselector;
  @override
  String? get selectedDay;
  @override
  @JsonKey(ignore: true)
  _$$_WeeklyModelCopyWith<_$_WeeklyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
