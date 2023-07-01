// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'split_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainingSplit {
  String get name => throw _privateConstructorUsedError;
  List<Workout> get workouts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingSplitCopyWith<TrainingSplit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingSplitCopyWith<$Res> {
  factory $TrainingSplitCopyWith(
          TrainingSplit value, $Res Function(TrainingSplit) then) =
      _$TrainingSplitCopyWithImpl<$Res, TrainingSplit>;
  @useResult
  $Res call({String name, List<Workout> workouts});
}

/// @nodoc
class _$TrainingSplitCopyWithImpl<$Res, $Val extends TrainingSplit>
    implements $TrainingSplitCopyWith<$Res> {
  _$TrainingSplitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workouts = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainingSplitCopyWith<$Res>
    implements $TrainingSplitCopyWith<$Res> {
  factory _$$_TrainingSplitCopyWith(
          _$_TrainingSplit value, $Res Function(_$_TrainingSplit) then) =
      __$$_TrainingSplitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<Workout> workouts});
}

/// @nodoc
class __$$_TrainingSplitCopyWithImpl<$Res>
    extends _$TrainingSplitCopyWithImpl<$Res, _$_TrainingSplit>
    implements _$$_TrainingSplitCopyWith<$Res> {
  __$$_TrainingSplitCopyWithImpl(
      _$_TrainingSplit _value, $Res Function(_$_TrainingSplit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workouts = null,
  }) {
    return _then(_$_TrainingSplit(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc

class _$_TrainingSplit implements _TrainingSplit {
  const _$_TrainingSplit(
      {required this.name, required final List<Workout> workouts})
      : _workouts = workouts;

  @override
  final String name;
  final List<Workout> _workouts;
  @override
  List<Workout> get workouts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'TrainingSplit(name: $name, workouts: $workouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainingSplit &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainingSplitCopyWith<_$_TrainingSplit> get copyWith =>
      __$$_TrainingSplitCopyWithImpl<_$_TrainingSplit>(this, _$identity);
}

abstract class _TrainingSplit implements TrainingSplit {
  const factory _TrainingSplit(
      {required final String name,
      required final List<Workout> workouts}) = _$_TrainingSplit;

  @override
  String get name;
  @override
  List<Workout> get workouts;
  @override
  @JsonKey(ignore: true)
  _$$_TrainingSplitCopyWith<_$_TrainingSplit> get copyWith =>
      throw _privateConstructorUsedError;
}
