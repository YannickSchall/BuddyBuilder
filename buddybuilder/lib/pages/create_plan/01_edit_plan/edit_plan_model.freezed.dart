// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditPlanModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Split> get splits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditPlanModelCopyWith<EditPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPlanModelCopyWith<$Res> {
  factory $EditPlanModelCopyWith(
          EditPlanModel value, $Res Function(EditPlanModel) then) =
      _$EditPlanModelCopyWithImpl<$Res, EditPlanModel>;
  @useResult
  $Res call({int id, String name, List<Split> splits});
}

/// @nodoc
class _$EditPlanModelCopyWithImpl<$Res, $Val extends EditPlanModel>
    implements $EditPlanModelCopyWith<$Res> {
  _$EditPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? splits = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      splits: null == splits
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditPlanModelCopyWith<$Res>
    implements $EditPlanModelCopyWith<$Res> {
  factory _$$_EditPlanModelCopyWith(
          _$_EditPlanModel value, $Res Function(_$_EditPlanModel) then) =
      __$$_EditPlanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<Split> splits});
}

/// @nodoc
class __$$_EditPlanModelCopyWithImpl<$Res>
    extends _$EditPlanModelCopyWithImpl<$Res, _$_EditPlanModel>
    implements _$$_EditPlanModelCopyWith<$Res> {
  __$$_EditPlanModelCopyWithImpl(
      _$_EditPlanModel _value, $Res Function(_$_EditPlanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? splits = null,
  }) {
    return _then(_$_EditPlanModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      splits: null == splits
          ? _value._splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
    ));
  }
}

/// @nodoc

class _$_EditPlanModel implements _EditPlanModel {
  const _$_EditPlanModel(
      {required this.id, required this.name, required final List<Split> splits})
      : _splits = splits;

  @override
  final int id;
  @override
  final String name;
  final List<Split> _splits;
  @override
  List<Split> get splits {
    if (_splits is EqualUnmodifiableListView) return _splits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splits);
  }

  @override
  String toString() {
    return 'EditPlanModel(id: $id, name: $name, splits: $splits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPlanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._splits, _splits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_splits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPlanModelCopyWith<_$_EditPlanModel> get copyWith =>
      __$$_EditPlanModelCopyWithImpl<_$_EditPlanModel>(this, _$identity);
}

abstract class _EditPlanModel implements EditPlanModel {
  const factory _EditPlanModel(
      {required final int id,
      required final String name,
      required final List<Split> splits}) = _$_EditPlanModel;

  @override
  int get id;
  @override
  String get name;
  @override
  List<Split> get splits;
  @override
  @JsonKey(ignore: true)
  _$$_EditPlanModelCopyWith<_$_EditPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
