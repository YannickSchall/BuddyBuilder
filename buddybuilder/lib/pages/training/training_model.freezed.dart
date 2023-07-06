// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainingModel {
  List<dynamic> get workoutList => throw _privateConstructorUsedError;
  String get workoutTitle => throw _privateConstructorUsedError;
  List<dynamic> get widgetList => throw _privateConstructorUsedError;
  int get setId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingModelCopyWith<TrainingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingModelCopyWith<$Res> {
  factory $TrainingModelCopyWith(
          TrainingModel value, $Res Function(TrainingModel) then) =
      _$TrainingModelCopyWithImpl<$Res, TrainingModel>;
  @useResult
  $Res call(
      {List<dynamic> workoutList,
      String workoutTitle,
      List<dynamic> widgetList,
      int setId});
}

/// @nodoc
class _$TrainingModelCopyWithImpl<$Res, $Val extends TrainingModel>
    implements $TrainingModelCopyWith<$Res> {
  _$TrainingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutList = null,
    Object? workoutTitle = null,
    Object? widgetList = null,
    Object? setId = null,
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
      widgetList: null == widgetList
          ? _value.widgetList
          : widgetList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      setId: null == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainingModelCopyWith<$Res>
    implements $TrainingModelCopyWith<$Res> {
  factory _$$_TrainingModelCopyWith(
          _$_TrainingModel value, $Res Function(_$_TrainingModel) then) =
      __$$_TrainingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> workoutList,
      String workoutTitle,
      List<dynamic> widgetList,
      int setId});
}

/// @nodoc
class __$$_TrainingModelCopyWithImpl<$Res>
    extends _$TrainingModelCopyWithImpl<$Res, _$_TrainingModel>
    implements _$$_TrainingModelCopyWith<$Res> {
  __$$_TrainingModelCopyWithImpl(
      _$_TrainingModel _value, $Res Function(_$_TrainingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutList = null,
    Object? workoutTitle = null,
    Object? widgetList = null,
    Object? setId = null,
  }) {
    return _then(_$_TrainingModel(
      workoutList: null == workoutList
          ? _value._workoutList
          : workoutList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      workoutTitle: null == workoutTitle
          ? _value.workoutTitle
          : workoutTitle // ignore: cast_nullable_to_non_nullable
              as String,
      widgetList: null == widgetList
          ? _value._widgetList
          : widgetList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      setId: null == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TrainingModel implements _TrainingModel {
  const _$_TrainingModel(
      {required final List<dynamic> workoutList,
      required this.workoutTitle,
      required final List<dynamic> widgetList,
      required this.setId})
      : _workoutList = workoutList,
        _widgetList = widgetList;

  final List<dynamic> _workoutList;
  @override
  List<dynamic> get workoutList {
    if (_workoutList is EqualUnmodifiableListView) return _workoutList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutList);
  }

  @override
  final String workoutTitle;
  final List<dynamic> _widgetList;
  @override
  List<dynamic> get widgetList {
    if (_widgetList is EqualUnmodifiableListView) return _widgetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_widgetList);
  }

  @override
  final int setId;

  @override
  String toString() {
    return 'TrainingModel(workoutList: $workoutList, workoutTitle: $workoutTitle, widgetList: $widgetList, setId: $setId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainingModel &&
            const DeepCollectionEquality()
                .equals(other._workoutList, _workoutList) &&
            (identical(other.workoutTitle, workoutTitle) ||
                other.workoutTitle == workoutTitle) &&
            const DeepCollectionEquality()
                .equals(other._widgetList, _widgetList) &&
            (identical(other.setId, setId) || other.setId == setId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workoutList),
      workoutTitle,
      const DeepCollectionEquality().hash(_widgetList),
      setId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainingModelCopyWith<_$_TrainingModel> get copyWith =>
      __$$_TrainingModelCopyWithImpl<_$_TrainingModel>(this, _$identity);
}

abstract class _TrainingModel implements TrainingModel {
  const factory _TrainingModel(
      {required final List<dynamic> workoutList,
      required final String workoutTitle,
      required final List<dynamic> widgetList,
      required final int setId}) = _$_TrainingModel;

  @override
  List<dynamic> get workoutList;
  @override
  String get workoutTitle;
  @override
  List<dynamic> get widgetList;
  @override
  int get setId;
  @override
  @JsonKey(ignore: true)
  _$$_TrainingModelCopyWith<_$_TrainingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
