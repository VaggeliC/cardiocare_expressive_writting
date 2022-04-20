// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tictactoe_game_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TicTacToeGameSessionModelTearOff {
  const _$TicTacToeGameSessionModelTearOff();

  _TicTacToeGameSessionModel call(
      {TicTacToePlayerType playerTurn = TicTacToePlayerType.none}) {
    return _TicTacToeGameSessionModel(
      playerTurn: playerTurn,
    );
  }
}

/// @nodoc
const $TicTacToeGameSessionModel = _$TicTacToeGameSessionModelTearOff();

/// @nodoc
mixin _$TicTacToeGameSessionModel {
  TicTacToePlayerType get playerTurn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicTacToeGameSessionModelCopyWith<TicTacToeGameSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicTacToeGameSessionModelCopyWith<$Res> {
  factory $TicTacToeGameSessionModelCopyWith(TicTacToeGameSessionModel value,
          $Res Function(TicTacToeGameSessionModel) then) =
      _$TicTacToeGameSessionModelCopyWithImpl<$Res>;
  $Res call({TicTacToePlayerType playerTurn});
}

/// @nodoc
class _$TicTacToeGameSessionModelCopyWithImpl<$Res>
    implements $TicTacToeGameSessionModelCopyWith<$Res> {
  _$TicTacToeGameSessionModelCopyWithImpl(this._value, this._then);

  final TicTacToeGameSessionModel _value;
  // ignore: unused_field
  final $Res Function(TicTacToeGameSessionModel) _then;

  @override
  $Res call({
    Object? playerTurn = freezed,
  }) {
    return _then(_value.copyWith(
      playerTurn: playerTurn == freezed
          ? _value.playerTurn
          : playerTurn // ignore: cast_nullable_to_non_nullable
              as TicTacToePlayerType,
    ));
  }
}

/// @nodoc
abstract class _$TicTacToeGameSessionModelCopyWith<$Res>
    implements $TicTacToeGameSessionModelCopyWith<$Res> {
  factory _$TicTacToeGameSessionModelCopyWith(_TicTacToeGameSessionModel value,
          $Res Function(_TicTacToeGameSessionModel) then) =
      __$TicTacToeGameSessionModelCopyWithImpl<$Res>;
  @override
  $Res call({TicTacToePlayerType playerTurn});
}

/// @nodoc
class __$TicTacToeGameSessionModelCopyWithImpl<$Res>
    extends _$TicTacToeGameSessionModelCopyWithImpl<$Res>
    implements _$TicTacToeGameSessionModelCopyWith<$Res> {
  __$TicTacToeGameSessionModelCopyWithImpl(_TicTacToeGameSessionModel _value,
      $Res Function(_TicTacToeGameSessionModel) _then)
      : super(_value, (v) => _then(v as _TicTacToeGameSessionModel));

  @override
  _TicTacToeGameSessionModel get _value =>
      super._value as _TicTacToeGameSessionModel;

  @override
  $Res call({
    Object? playerTurn = freezed,
  }) {
    return _then(_TicTacToeGameSessionModel(
      playerTurn: playerTurn == freezed
          ? _value.playerTurn
          : playerTurn // ignore: cast_nullable_to_non_nullable
              as TicTacToePlayerType,
    ));
  }
}

/// @nodoc

class _$_TicTacToeGameSessionModel implements _TicTacToeGameSessionModel {
  const _$_TicTacToeGameSessionModel(
      {this.playerTurn = TicTacToePlayerType.none});

  @JsonKey()
  @override
  final TicTacToePlayerType playerTurn;

  @override
  String toString() {
    return 'TicTacToeGameSessionModel(playerTurn: $playerTurn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicTacToeGameSessionModel &&
            const DeepCollectionEquality()
                .equals(other.playerTurn, playerTurn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(playerTurn));

  @JsonKey(ignore: true)
  @override
  _$TicTacToeGameSessionModelCopyWith<_TicTacToeGameSessionModel>
      get copyWith =>
          __$TicTacToeGameSessionModelCopyWithImpl<_TicTacToeGameSessionModel>(
              this, _$identity);
}

abstract class _TicTacToeGameSessionModel implements TicTacToeGameSessionModel {
  const factory _TicTacToeGameSessionModel({TicTacToePlayerType playerTurn}) =
      _$_TicTacToeGameSessionModel;

  @override
  TicTacToePlayerType get playerTurn;
  @override
  @JsonKey(ignore: true)
  _$TicTacToeGameSessionModelCopyWith<_TicTacToeGameSessionModel>
      get copyWith => throw _privateConstructorUsedError;
}
