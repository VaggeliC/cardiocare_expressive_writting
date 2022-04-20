import 'package:cardiocare_expressive_writting/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/utilities/tictactoe_utilities.dart';
import 'package:flutter/material.dart';

class TicTacToeGameBoardTile extends StatelessWidget {
  final VoidCallback? onPressed;

  final double dimension;

  final TicTacToePlayerType tileStatus;

  const TicTacToeGameBoardTile(
      {Key? key,
      required this.onPressed,
      required this.dimension,
      this.tileStatus = TicTacToePlayerType.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = getTicTacToeStatusImage(tileStatus);

    return SizedBox(
        width: dimension,
        height: dimension,
        child: IconButton(onPressed: onPressed, icon: image ?? Container()));
  }
}
