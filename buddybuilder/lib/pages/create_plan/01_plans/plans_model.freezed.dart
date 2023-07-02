// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plans_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainingPlan {
  String get name => throw _privateConstructorUsedError;
  List<TrainingSplit> get splits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingPlanCopyWith<TrainingPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingPlanCopyWith<$Res> {
  factory $TrainingPlanCopyWith(
          TrainingPlan value, $Res Function(TrainingPlan) then) =
      _$TrainingPlanCopyWithImpl<$Res, TrainingPlan>;
  @useResult
  $Res call({String name, List<TrainingSplit> splits});
}

/// @nodoc
class _$TrainingPlanCopyWithImpl<$Res, $Val extends TrainingPlan>
    implements $TrainingPlanCopyWith<$Res> {
  _$TrainingPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? splits = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      splits: null == splits
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<TrainingSplit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainingPlanCopyWith<$Res>
    implements $TrainingPlanCopyWith<$Res> {
  factory _$$_TrainingPlanCopyWith(
          _$_TrainingPlan value, $Res Function(_$_TrainingPlan) then) =
      __$$_TrainingPlanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<TrainingSplit> splits});
}

/// @nodoc
class __$$_TrainingPlanCopyWithImpl<$Res>
    extends _$TrainingPlanCopyWithImpl<$Res, _$_TrainingPlan>
    implements _$$_TrainingPlanCopyWith<$Res> {
  __$$_TrainingPlanCopyWithImpl(
      _$_TrainingPlan _value, $Res Function(_$_TrainingPlan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? splits = null,
  }) {
    return _then(_$_TrainingPlan(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      splits: null == splits
          ? _value._splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<TrainingSplit>,
    ));
  }
}

/// @nodoc

class _$_TrainingPlan implements _TrainingPlan {
  const _$_TrainingPlan(
      {required this.name, required final List<TrainingSplit> splits})
      : _splits = splits;

  @override
  final String name;
  final List<TrainingSplit> _splits;
  @override
  List<TrainingSplit> get splits {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splits);
  }

  @override
  String toString() {
    return 'TrainingPlan(name: $name, splits: $splits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainingPlan &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._splits, _splits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_splits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainingPlanCopyWith<_$_TrainingPlan> get copyWith =>
      __$$_TrainingPlanCopyWithImpl<_$_TrainingPlan>(this, _$identity);
}

abstract class _TrainingPlan implements TrainingPlan {
  const factory _TrainingPlan(
      {required final String name,
      required final List<TrainingSplit> splits}) = _$_TrainingPlan;

  @override
  String get name;
  @override
  List<TrainingSplit> get splits;
  @override
  @JsonKey(ignore: true)
  _$$_TrainingPlanCopyWith<_$_TrainingPlan> get copyWith =>
      throw _privateConstructorUsedError;
}
