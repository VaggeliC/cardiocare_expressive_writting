import 'dart:math';
import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/context/tictactoe_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/models/tictactoe_game_model.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/utilities/tictactoe_utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const botThinkMinTimeMSecs = 500;
const botThinkTimeMSecs = 500;

class TicTacToeGameNotifier extends BaseGameNotifier<TicTacToeGameModel,
    TicTacToeGameListNotifier, TicTacToeInitializeParams, TicTacToePlayParams> {
  TicTacToePlayerType _playerTurn = TicTacToePlayerType.none;

  late DateTime _playerTurnStart;

  TicTacToeGameNotifier(
      Ref ref,
      StateNotifierProvider<TicTacToeGameListNotifier, List<TicTacToeGameModel>>
          gameListProvider,
      {TicTacToeGameModel? initialState})
      : super(ref, gameListProvider, initialState ?? TicTacToeGameModel());

  bool isBoardFull() => state.board.every((element) {
        return element != TicTacToePlayerType.none;
      });

  bool isPlayerTurn() => _playerTurn == state.player;

  @override
  bool isPlaying() => !isBoardFull() && state.status == GameStatusType.playing;

  TicTacToePlayerType getNextPlayer() {
    switch (_playerTurn) {
      case TicTacToePlayerType.x:
        return TicTacToePlayerType.o;
      case TicTacToePlayerType.o:
        return TicTacToePlayerType.x;
      default:
        return TicTacToePlayerType.none;
    }
  }

  void _setCell(int index, TicTacToePlayerType player) {
    if (state.board[index] == TicTacToePlayerType.none &&
        player != TicTacToePlayerType.none) {
      List<TicTacToePlayerType> temp = [...state.board];
      temp[index] = player;

      state = state.copyWith(board: temp);
    }
  }

  void _switchPlayer() {
    if (!isPlaying()) {
      return;
    }

    if (isPlayerTurn()) {
      _playerTurnStart = DateTime.now();
    }

    _playerTurn = _playerTurn == TicTacToePlayerType.x
        ? TicTacToePlayerType.o
        : TicTacToePlayerType.x;
  }

  bool _checkWinningCells(int a, int b, int c) =>
      state.board[a] != TicTacToePlayerType.none &&
      state.board[a] == state.board[b] &&
      state.board[a] == state.board[c];

  void _calculateMetrics(int millisecs) {
    var maxResp = state.maxResponseTime ?? millisecs;
    var minResp = state.minResponseTime ?? millisecs;
    var avgResp = state.avgResponseTime ?? millisecs;

    if (millisecs > maxResp) {
      maxResp = millisecs;
    }

    if (millisecs < minResp) {
      minResp = millisecs;
    }

    avgResp = (avgResp + millisecs) ~/ 2;

    state = state.copyWith(
        avgResponseTime: avgResp.toDouble(),
        minResponseTime: minResp.toDouble(),
        maxResponseTime: maxResp.toDouble());
  }

  void _checkWinner() {
    DateTime endTime = DateTime.now();

    bool winner = (_checkWinningCells(0, 1, 2) ||
        _checkWinningCells(3, 4, 5) ||
        _checkWinningCells(6, 7, 8) ||
        _checkWinningCells(0, 3, 6) ||
        _checkWinningCells(1, 4, 7) ||
        _checkWinningCells(2, 5, 8) ||
        _checkWinningCells(0, 4, 8) ||
        _checkWinningCells(2, 4, 6));

    if (isBoardFull() && !winner) {
      state = state.copyWith(
          endTime: endTime,
          // draws: state.draws + 1,
          status: GameStatusType.draw);
    }

    if (winner) {
      state = state.copyWith(
          endTime: endTime,
          status: isPlayerTurn() ? GameStatusType.won : GameStatusType.lost);
    }
  }

  Future _botPlay() async {
    if (!isPlaying()) {
      return;
    }

    // fake delay to simulate random humanized response
    int botThinkDelay = botThinkMinTimeMSecs +
        (Random().nextDouble() * botThinkTimeMSecs).toInt();

    await Future.delayed(Duration(milliseconds: botThinkDelay), () {
      List<int> temp = <int>[];

      for (var i = 0; i < state.board.length; i++) {
        if (state.board[i] == TicTacToePlayerType.none) {
          temp.add(i);
        }
      }

      int index = Random().nextInt(temp.length);

      _setCell(temp[index], _playerTurn);

      _checkWinner();

      _switchPlayer();
    });
  }

  @override
  void initialize(TicTacToeInitializeParams? params) {
    // randomize player tile
    final _player = params != null && params.player != null
        ? params.player!
        : randomTicTacToePlayer();

    // randomize first player
    final _firstPlayer = params != null && params.firstPlayer != null
        ? params.firstPlayer!
        : randomTicTacToePlayer();

    _playerTurn = _firstPlayer;

    state = TicTacToeGameModel(
        player: _player,
        firstPlayer: _firstPlayer,
        status: GameStatusType.playing,
        startTime: DateTime.now());

    if (!isPlayerTurn()) {
      _botPlay();
    }

    _playerTurnStart = DateTime.now();
  }

  @override
  Future playTurn(TicTacToePlayParams? params) async {
    if (!isPlaying()) {
      return state.status;
    }

    if (state.board[params!.tileIndex] != TicTacToePlayerType.none) {
      return state.status;
    }

    int diff = DateTime.now().difference(_playerTurnStart).inMilliseconds;

    _calculateMetrics(diff);

    _setCell(params.tileIndex, _playerTurn);

    _checkWinner();

    _switchPlayer();

    await _botPlay();

    return state.status;
  }
}

class TicTacToeInitializeParams {
  final TicTacToePlayerType? player;

  final TicTacToePlayerType? firstPlayer;

  TicTacToeInitializeParams({this.player, this.firstPlayer});
}

class TicTacToePlayParams {
  final int tileIndex;

  TicTacToePlayParams(this.tileIndex);
}
