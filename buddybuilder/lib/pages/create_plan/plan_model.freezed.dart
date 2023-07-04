// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlanModel {
  List<Plan> get plans => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res, PlanModel>;
  @useResult
  $Res call({List<Plan> plans});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res, $Val extends PlanModel>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plans = null,
  }) {
    return _then(_value.copyWith(
      plans: null == plans
          ? _value.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<Plan>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlanModelCopyWith<$Res> implements $PlanModelCopyWith<$Res> {
  factory _$$_PlanModelCopyWith(
          _$_PlanModel value, $Res Function(_$_PlanModel) then) =
      __$$_PlanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Plan> plans});
}

/// @nodoc
class __$$_PlanModelCopyWithImpl<$Res>
    extends _$PlanModelCopyWithImpl<$Res, _$_PlanModel>
    implements _$$_PlanModelCopyWith<$Res> {
  __$$_PlanModelCopyWithImpl(
      _$_PlanModel _value, $Res Function(_$_PlanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plans = null,
  }) {
    return _then(_$_PlanModel(
      plans: null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<Plan>,
    ));
  }
}

/// @nodoc

class _$_PlanModel implements _PlanModel {
  const _$_PlanModel({required final List<Plan> plans}) : _plans = plans;

  final List<Plan> _plans;
  @override
  List<Plan> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  String toString() {
    return 'PlanModel(plans: $plans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlanModel &&
            const DeepCollectionEquality().equals(other._plans, _plans));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_plans));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      __$$_PlanModelCopyWithImpl<_$_PlanModel>(this, _$identity);
}

abstract class _PlanModel implements PlanModel {
  const factory _PlanModel({required final List<Plan> plans}) = _$_PlanModel;

  @override
  List<Plan> get plans;
  @override
  @JsonKey(ignore: true)
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
