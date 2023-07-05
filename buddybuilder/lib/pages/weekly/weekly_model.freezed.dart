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
  List<dynamic> get splitList => throw _privateConstructorUsedError;
  String get splitTitle => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get weekselector => throw _privateConstructorUsedError;
  String? get selectedDay => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get dateSplitMap => throw _privateConstructorUsedError;

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
      {List<dynamic> splitList,
      String splitTitle,
      String searchQuery,
      bool weekselector,
      String? selectedDay,
      Map<dynamic, dynamic> dateSplitMap});
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
    Object? splitList = null,
    Object? splitTitle = null,
    Object? searchQuery = null,
    Object? weekselector = null,
    Object? selectedDay = freezed,
    Object? dateSplitMap = null,
  }) {
    return _then(_value.copyWith(
      splitList: null == splitList
          ? _value.splitList
          : splitList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      splitTitle: null == splitTitle
          ? _value.splitTitle
          : splitTitle // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      weekselector: null == weekselector
          ? _value.weekselector
          : weekselector // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSplitMap: null == dateSplitMap
          ? _value.dateSplitMap
          : dateSplitMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
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
      {List<dynamic> splitList,
      String splitTitle,
      String searchQuery,
      bool weekselector,
      String? selectedDay,
      Map<dynamic, dynamic> dateSplitMap});
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
    Object? splitList = null,
    Object? splitTitle = null,
    Object? searchQuery = null,
    Object? weekselector = null,
    Object? selectedDay = freezed,
    Object? dateSplitMap = null,
  }) {
    return _then(_$_WeeklyModel(
      splitList: null == splitList
          ? _value._splitList
          : splitList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      splitTitle: null == splitTitle
          ? _value.splitTitle
          : splitTitle // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      weekselector: null == weekselector
          ? _value.weekselector
          : weekselector // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSplitMap: null == dateSplitMap
          ? _value._dateSplitMap
          : dateSplitMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$_WeeklyModel implements _WeeklyModel {
  const _$_WeeklyModel(
      {required final List<dynamic> splitList,
      required this.splitTitle,
      required this.searchQuery,
      required this.weekselector,
      required this.selectedDay,
      required final Map<dynamic, dynamic> dateSplitMap})
      : _splitList = splitList,
        _dateSplitMap = dateSplitMap;

  final List<dynamic> _splitList;
  @override
  List<dynamic> get splitList {
    if (_splitList is EqualUnmodifiableListView) return _splitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splitList);
  }

  @override
  final String splitTitle;
  @override
  final String searchQuery;
  @override
  final bool weekselector;
  @override
  final String? selectedDay;
  final Map<dynamic, dynamic> _dateSplitMap;
  @override
  Map<dynamic, dynamic> get dateSplitMap {
    if (_dateSplitMap is EqualUnmodifiableMapView) return _dateSplitMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dateSplitMap);
  }

  @override
  String toString() {
    return 'WeeklyModel(splitList: $splitList, splitTitle: $splitTitle, searchQuery: $searchQuery, weekselector: $weekselector, selectedDay: $selectedDay, dateSplitMap: $dateSplitMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeeklyModel &&
            const DeepCollectionEquality()
                .equals(other._splitList, _splitList) &&
            (identical(other.splitTitle, splitTitle) ||
                other.splitTitle == splitTitle) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.weekselector, weekselector) ||
                other.weekselector == weekselector) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality()
                .equals(other._dateSplitMap, _dateSplitMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_splitList),
      splitTitle,
      searchQuery,
      weekselector,
      selectedDay,
      const DeepCollectionEquality().hash(_dateSplitMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeeklyModelCopyWith<_$_WeeklyModel> get copyWith =>
      __$$_WeeklyModelCopyWithImpl<_$_WeeklyModel>(this, _$identity);
}

abstract class _WeeklyModel implements WeeklyModel {
  const factory _WeeklyModel(
      {required final List<dynamic> splitList,
      required final String splitTitle,
      required final String searchQuery,
      required final bool weekselector,
      required final String? selectedDay,
      required final Map<dynamic, dynamic> dateSplitMap}) = _$_WeeklyModel;

  @override
  List<dynamic> get splitList;
  @override
  String get splitTitle;
  @override
  String get searchQuery;
  @override
  bool get weekselector;
  @override
  String? get selectedDay;
  @override
  Map<dynamic, dynamic> get dateSplitMap;
  @override
  @JsonKey(ignore: true)
  _$$_WeeklyModelCopyWith<_$_WeeklyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
