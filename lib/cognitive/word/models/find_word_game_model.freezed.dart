// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'find_word_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FindWordGameModelTearOff {
  const _$FindWordGameModelTearOff();

  _FindWordGameModel call(
      {GameStatusType status = GameStatusType.none,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      int rows = findWordDefaultRows,
      int columns = findWordDefaultColumns,
      List<String> words = const [],
      FindWordNewPuzzle? puzzle,
      Point<int>? selectedStartTile,
      Point<int>? selectedEndTile,
      Offset? dragStart,
      Offset? dragEnd}) {
    return _FindWordGameModel(
      status: status,
      startTime: startTime,
      endTime: endTime,
      minResponseTime: minResponseTime,
      maxResponseTime: maxResponseTime,
      avgResponseTime: avgResponseTime,
      rows: rows,
      columns: columns,
      words: words,
      puzzle: puzzle,
      selectedStartTile: selectedStartTile,
      selectedEndTile: selectedEndTile,
      dragStart: dragStart,
      dragEnd: dragEnd,
    );
  }
}

/// @nodoc
const $FindWordGameModel = _$FindWordGameModelTearOff();

/// @nodoc
mixin _$FindWordGameModel {
  GameStatusType get status => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  double? get minResponseTime => throw _privateConstructorUsedError;
  double? get maxResponseTime => throw _privateConstructorUsedError;
  double? get avgResponseTime => throw _privateConstructorUsedError;
  int get rows => throw _privateConstructorUsedError;
  int get columns => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  FindWordNewPuzzle? get puzzle => throw _privateConstructorUsedError;
  Point<int>? get selectedStartTile => throw _privateConstructorUsedError;
  Point<int>? get selectedEndTile =>
      throw _privateConstructorUsedError; // int? selectedCellStart,
// int? selectedCellEnd,
  Offset? get dragStart => throw _privateConstructorUsedError;
  Offset? get dragEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindWordGameModelCopyWith<FindWordGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindWordGameModelCopyWith<$Res> {
  factory $FindWordGameModelCopyWith(
          FindWordGameModel value, $Res Function(FindWordGameModel) then) =
      _$FindWordGameModelCopyWithImpl<$Res>;
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      int rows,
      int columns,
      List<String> words,
      FindWordNewPuzzle? puzzle,
      Point<int>? selectedStartTile,
      Point<int>? selectedEndTile,
      Offset? dragStart,
      Offset? dragEnd});
}

/// @nodoc
class _$FindWordGameModelCopyWithImpl<$Res>
    implements $FindWordGameModelCopyWith<$Res> {
  _$FindWordGameModelCopyWithImpl(this._value, this._then);

  final FindWordGameModel _value;
  // ignore: unused_field
  final $Res Function(FindWordGameModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
    Object? rows = freezed,
    Object? columns = freezed,
    Object? words = freezed,
    Object? puzzle = freezed,
    Object? selectedStartTile = freezed,
    Object? selectedEndTile = freezed,
    Object? dragStart = freezed,
    Object? dragEnd = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatusType,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minResponseTime: minResponseTime == freezed
          ? _value.minResponseTime
          : minResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseTime: maxResponseTime == freezed
          ? _value.maxResponseTime
          : maxResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResponseTime: avgResponseTime == freezed
          ? _value.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      rows: rows == freezed
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      puzzle: puzzle == freezed
          ? _value.puzzle
          : puzzle // ignore: cast_nullable_to_non_nullable
              as FindWordNewPuzzle?,
      selectedStartTile: selectedStartTile == freezed
          ? _value.selectedStartTile
          : selectedStartTile // ignore: cast_nullable_to_non_nullable
              as Point<int>?,
      selectedEndTile: selectedEndTile == freezed
          ? _value.selectedEndTile
          : selectedEndTile // ignore: cast_nullable_to_non_nullable
              as Point<int>?,
      dragStart: dragStart == freezed
          ? _value.dragStart
          : dragStart // ignore: cast_nullable_to_non_nullable
              as Offset?,
      dragEnd: dragEnd == freezed
          ? _value.dragEnd
          : dragEnd // ignore: cast_nullable_to_non_nullable
              as Offset?,
    ));
  }
}

/// @nodoc
abstract class _$FindWordGameModelCopyWith<$Res>
    implements $FindWordGameModelCopyWith<$Res> {
  factory _$FindWordGameModelCopyWith(
          _FindWordGameModel value, $Res Function(_FindWordGameModel) then) =
      __$FindWordGameModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      int rows,
      int columns,
      List<String> words,
      FindWordNewPuzzle? puzzle,
      Point<int>? selectedStartTile,
      Point<int>? selectedEndTile,
      Offset? dragStart,
      Offset? dragEnd});
}

/// @nodoc
class __$FindWordGameModelCopyWithImpl<$Res>
    extends _$FindWordGameModelCopyWithImpl<$Res>
    implements _$FindWordGameModelCopyWith<$Res> {
  __$FindWordGameModelCopyWithImpl(
      _FindWordGameModel _value, $Res Function(_FindWordGameModel) _then)
      : super(_value, (v) => _then(v as _FindWordGameModel));

  @override
  _FindWordGameModel get _value => super._value as _FindWordGameModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
    Object? rows = freezed,
    Object? columns = freezed,
    Object? words = freezed,
    Object? puzzle = freezed,
    Object? selectedStartTile = freezed,
    Object? selectedEndTile = freezed,
    Object? dragStart = freezed,
    Object? dragEnd = freezed,
  }) {
    return _then(_FindWordGameModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatusType,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minResponseTime: minResponseTime == freezed
          ? _value.minResponseTime
          : minResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseTime: maxResponseTime == freezed
          ? _value.maxResponseTime
          : maxResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResponseTime: avgResponseTime == freezed
          ? _value.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      rows: rows == freezed
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      puzzle: puzzle == freezed
          ? _value.puzzle
          : puzzle // ignore: cast_nullable_to_non_nullable
              as FindWordNewPuzzle?,
      selectedStartTile: selectedStartTile == freezed
          ? _value.selectedStartTile
          : selectedStartTile // ignore: cast_nullable_to_non_nullable
              as Point<int>?,
      selectedEndTile: selectedEndTile == freezed
          ? _value.selectedEndTile
          : selectedEndTile // ignore: cast_nullable_to_non_nullable
              as Point<int>?,
      dragStart: dragStart == freezed
          ? _value.dragStart
          : dragStart // ignore: cast_nullable_to_non_nullable
              as Offset?,
      dragEnd: dragEnd == freezed
          ? _value.dragEnd
          : dragEnd // ignore: cast_nullable_to_non_nullable
              as Offset?,
    ));
  }
}

/// @nodoc

@Implements<BaseGameModel>()
class _$_FindWordGameModel implements _FindWordGameModel {
  const _$_FindWordGameModel(
      {this.status = GameStatusType.none,
      this.startTime,
      this.endTime,
      this.minResponseTime,
      this.maxResponseTime,
      this.avgResponseTime,
      this.rows = findWordDefaultRows,
      this.columns = findWordDefaultColumns,
      this.words = const [],
      this.puzzle,
      this.selectedStartTile,
      this.selectedEndTile,
      this.dragStart,
      this.dragEnd});

  @JsonKey()
  @override
  final GameStatusType status;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final double? minResponseTime;
  @override
  final double? maxResponseTime;
  @override
  final double? avgResponseTime;
  @JsonKey()
  @override
  final int rows;
  @JsonKey()
  @override
  final int columns;
  @JsonKey()
  @override
  final List<String> words;
  @override
  final FindWordNewPuzzle? puzzle;
  @override
  final Point<int>? selectedStartTile;
  @override
  final Point<int>? selectedEndTile;
  @override // int? selectedCellStart,
// int? selectedCellEnd,
  final Offset? dragStart;
  @override
  final Offset? dragEnd;

  @override
  String toString() {
    return 'FindWordGameModel(status: $status, startTime: $startTime, endTime: $endTime, minResponseTime: $minResponseTime, maxResponseTime: $maxResponseTime, avgResponseTime: $avgResponseTime, rows: $rows, columns: $columns, words: $words, puzzle: $puzzle, selectedStartTile: $selectedStartTile, selectedEndTile: $selectedEndTile, dragStart: $dragStart, dragEnd: $dragEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FindWordGameModel &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.minResponseTime, minResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.maxResponseTime, maxResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.avgResponseTime, avgResponseTime) &&
            const DeepCollectionEquality().equals(other.rows, rows) &&
            const DeepCollectionEquality().equals(other.columns, columns) &&
            const DeepCollectionEquality().equals(other.words, words) &&
            const DeepCollectionEquality().equals(other.puzzle, puzzle) &&
            const DeepCollectionEquality()
                .equals(other.selectedStartTile, selectedStartTile) &&
            const DeepCollectionEquality()
                .equals(other.selectedEndTile, selectedEndTile) &&
            const DeepCollectionEquality().equals(other.dragStart, dragStart) &&
            const DeepCollectionEquality().equals(other.dragEnd, dragEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(minResponseTime),
      const DeepCollectionEquality().hash(maxResponseTime),
      const DeepCollectionEquality().hash(avgResponseTime),
      const DeepCollectionEquality().hash(rows),
      const DeepCollectionEquality().hash(columns),
      const DeepCollectionEquality().hash(words),
      const DeepCollectionEquality().hash(puzzle),
      const DeepCollectionEquality().hash(selectedStartTile),
      const DeepCollectionEquality().hash(selectedEndTile),
      const DeepCollectionEquality().hash(dragStart),
      const DeepCollectionEquality().hash(dragEnd));

  @JsonKey(ignore: true)
  @override
  _$FindWordGameModelCopyWith<_FindWordGameModel> get copyWith =>
      __$FindWordGameModelCopyWithImpl<_FindWordGameModel>(this, _$identity);
}

abstract class _FindWordGameModel implements FindWordGameModel, BaseGameModel {
  const factory _FindWordGameModel(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      int rows,
      int columns,
      List<String> words,
      FindWordNewPuzzle? puzzle,
      Point<int>? selectedStartTile,
      Point<int>? selectedEndTile,
      Offset? dragStart,
      Offset? dragEnd}) = _$_FindWordGameModel;

  @override
  GameStatusType get status;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  double? get minResponseTime;
  @override
  double? get maxResponseTime;
  @override
  double? get avgResponseTime;
  @override
  int get rows;
  @override
  int get columns;
  @override
  List<String> get words;
  @override
  FindWordNewPuzzle? get puzzle;
  @override
  Point<int>? get selectedStartTile;
  @override
  Point<int>? get selectedEndTile;
  @override // int? selectedCellStart,
// int? selectedCellEnd,
  Offset? get dragStart;
  @override
  Offset? get dragEnd;
  @override
  @JsonKey(ignore: true)
  _$FindWordGameModelCopyWith<_FindWordGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
