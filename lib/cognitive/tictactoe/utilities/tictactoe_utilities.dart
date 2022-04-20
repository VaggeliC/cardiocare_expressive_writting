import 'dart:math';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:flutter/material.dart';

final _rand = Random();

TicTacToePlayerType randomTicTacToePlayer() =>
    _rand.nextBool() == true ? TicTacToePlayerType.x : TicTacToePlayerType.o;

String ticTacToePlayerToString(TicTacToePlayerType player) {
  switch (player) {
    case TicTacToePlayerType.x:
      return 'x';
    case TicTacToePlayerType.o:
      return 'o';
    default:
      return '';
  }
}

TicTacToePlayerType getNextTicTacToePlayer(TicTacToePlayerType player) {
  switch (player) {
    case TicTacToePlayerType.x:
      return TicTacToePlayerType.o;
    case TicTacToePlayerType.o:
      return TicTacToePlayerType.x;
    default:
      return TicTacToePlayerType.none;
  }
}

Image? getTicTacToeStatusImage(TicTacToePlayerType status) {
  switch (status) {
    case TicTacToePlayerType.x:
      return Image.asset('assets/images/tic_tac_toe_x.png');
    case TicTacToePlayerType.o:
      return Image.asset('assets/images/tic_tac_toe_o.png');
    default:
      return null;
  }
}

String ticTacToeGetGameStatusText(GameStatusType status) {
  switch (status) {
    case GameStatusType.won:
      return 'cognitive.gameTicTacToe.winText';
    case GameStatusType.draw:
      return 'cognitive.gameTicTacToe.drawText';
    case GameStatusType.lost:
      return 'cognitive.gameTicTacToe.lostText';

    default:
      return '';
  }
}
