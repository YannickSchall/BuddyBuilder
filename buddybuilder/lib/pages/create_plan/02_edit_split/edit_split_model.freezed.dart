// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_split_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditSplitModel {
  List<dynamic> get workoutList => throw _privateConstructorUsedError;
  String get workoutTitle => throw _privateConstructorUsedError;
  List<dynamic> get widgetList => throw _privateConstructorUsedError;
  int get setId => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditSplitModelCopyWith<EditSplitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditSplitModelCopyWith<$Res> {
  factory $EditSplitModelCopyWith(
          EditSplitModel value, $Res Function(EditSplitModel) then) =
      _$EditSplitModelCopyWithImpl<$Res, EditSplitModel>;
  @useResult
  $Res call(
      {List<dynamic> workoutList,
      String workoutTitle,
      List<dynamic> widgetList,
      int setId,
      String? searchQuery});
}

/// @nodoc
class _$EditSplitModelCopyWithImpl<$Res, $Val extends EditSplitModel>
    implements $EditSplitModelCopyWith<$Res> {
  _$EditSplitModelCopyWithImpl(this._value, this._then);

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
    Object? searchQuery = freezed,
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
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditSplitModelCopyWith<$Res>
    implements $EditSplitModelCopyWith<$Res> {
  factory _$$_EditSplitModelCopyWith(
          _$_EditSplitModel value, $Res Function(_$_EditSplitModel) then) =
      __$$_EditSplitModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> workoutList,
      String workoutTitle,
      List<dynamic> widgetList,
      int setId,
      String? searchQuery});
}

/// @nodoc
class __$$_EditSplitModelCopyWithImpl<$Res>
    extends _$EditSplitModelCopyWithImpl<$Res, _$_EditSplitModel>
    implements _$$_EditSplitModelCopyWith<$Res> {
  __$$_EditSplitModelCopyWithImpl(
      _$_EditSplitModel _value, $Res Function(_$_EditSplitModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutList = null,
    Object? workoutTitle = null,
    Object? widgetList = null,
    Object? setId = null,
    Object? searchQuery = freezed,
  }) {
    return _then(_$_EditSplitModel(
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
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditSplitModel implements _EditSplitModel {
  const _$_EditSplitModel(
      {required final List<dynamic> workoutList,
      required this.workoutTitle,
      required final List<dynamic> widgetList,
      required this.setId,
      this.searchQuery})
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
  final String? searchQuery;

  @override
  String toString() {
    return 'EditSplitModel(workoutList: $workoutList, workoutTitle: $workoutTitle, widgetList: $widgetList, setId: $setId, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditSplitModel &&
            const DeepCollectionEquality()
                .equals(other._workoutList, _workoutList) &&
            (identical(other.workoutTitle, workoutTitle) ||
                other.workoutTitle == workoutTitle) &&
            const DeepCollectionEquality()
                .equals(other._widgetList, _widgetList) &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workoutList),
      workoutTitle,
      const DeepCollectionEquality().hash(_widgetList),
      setId,
      searchQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditSplitModelCopyWith<_$_EditSplitModel> get copyWith =>
      __$$_EditSplitModelCopyWithImpl<_$_EditSplitModel>(this, _$identity);
}

abstract class _EditSplitModel implements EditSplitModel {
  const factory _EditSplitModel(
      {required final List<dynamic> workoutList,
      required final String workoutTitle,
      required final List<dynamic> widgetList,
      required final int setId,
      final String? searchQuery}) = _$_EditSplitModel;

  @override
  List<dynamic> get workoutList;
  @override
  String get workoutTitle;
  @override
  List<dynamic> get widgetList;
  @override
  int get setId;
  @override
  String? get searchQuery;
  @override
  @JsonKey(ignore: true)
  _$$_EditSplitModelCopyWith<_$_EditSplitModel> get copyWith =>
      throw _privateConstructorUsedError;
}
