// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_split_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewSplitModel {
  List<dynamic> get workoutList => throw _privateConstructorUsedError;
  String get workoutTitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewSplitModelCopyWith<NewSplitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewSplitModelCopyWith<$Res> {
  factory $NewSplitModelCopyWith(
          NewSplitModel value, $Res Function(NewSplitModel) then) =
      _$NewSplitModelCopyWithImpl<$Res, NewSplitModel>;
  @useResult
  $Res call({List<dynamic> workoutList, String workoutTitle});
}

/// @nodoc
class _$NewSplitModelCopyWithImpl<$Res, $Val extends NewSplitModel>
    implements $NewSplitModelCopyWith<$Res> {
  _$NewSplitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutList = null,
    Object? workoutTitle = null,
  }) {
    return _then(_value.copyWith(
      workoutList: null == workoutList
          ? _value.workoutList
          : workoutList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      workoutTitle: null == workoutTitle
          ? _value.workoutTitle
          : workoutTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewSplitModelCopyWith<$Res>
    implements $NewSplitModelCopyWith<$Res> {
  factory _$$_NewSplitModelCopyWith(
          _$_NewSplitModel value, $Res Function(_$_NewSplitModel) then) =
      __$$_NewSplitModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> workoutList, String workoutTitle});
}

/// @nodoc
class __$$_NewSplitModelCopyWithImpl<$Res>
    extends _$NewSplitModelCopyWithImpl<$Res, _$_NewSplitModel>
    implements _$$_NewSplitModelCopyWith<$Res> {
  __$$_NewSplitModelCopyWithImpl(
      _$_NewSplitModel _value, $Res Function(_$_NewSplitModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutList = null,
    Object? workoutTitle = null,
  }) {
    return _then(_$_NewSplitModel(
      workoutList: null == workoutList
          ? _value._workoutList
          : workoutList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      workoutTitle: null == workoutTitle
          ? _value.workoutTitle
          : workoutTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NewSplitModel implements _NewSplitModel {
  const _$_NewSplitModel(
      {required final List<dynamic> workoutList, required this.workoutTitle})
      : _workoutList = workoutList;

  final List<dynamic> _workoutList;
  @override
  List<dynamic> get workoutList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutList);
  }

  @override
  final String workoutTitle;

  @override
  String toString() {
    return 'NewSplitModel(workoutList: $workoutList, workoutTitle: $workoutTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewSplitModel &&
            const DeepCollectionEquality()
                .equals(other._workoutList, _workoutList) &&
            (identical(other.workoutTitle, workoutTitle) ||
                other.workoutTitle == workoutTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_workoutList), workoutTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewSplitModelCopyWith<_$_NewSplitModel> get copyWith =>
      __$$_NewSplitModelCopyWithImpl<_$_NewSplitModel>(this, _$identity);
}

abstract class _NewSplitModel implements NewSplitModel {
  const factory _NewSplitModel(
      {required final List<dynamic> workoutList,
      required final String workoutTitle}) = _$_NewSplitModel;

  @override
  List<dynamic> get workoutList;
  @override
  String get workoutTitle;
  @override
  @JsonKey(ignore: true)
  _$$_NewSplitModelCopyWith<_$_NewSplitModel> get copyWith =>
      throw _privateConstructorUsedError;
}
