import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/game_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/context/tictactoe_game_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/context/tictactoe_game_providers.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/utilities/tictactoe_utilities.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/widgets/tictactoe_game_board.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicTacToeGameScreen extends HookConsumerWidget {
  const TicTacToeGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(ticTacToeActiveGameProvider);
    final gameNotifier = ref.read(ticTacToeActiveGameProvider.notifier);

    return GameScreenLayout(
      title: 'cognitive.gameTicTacToe.title'.tr(),
      gameListProvider: ticTacToeGameListProvider,
      gameArea: Center(child: TicTacToeGameBoard()),
      onRestartPressed: () {
        gameNotifier.initialize(TicTacToeInitializeParams());
      },
      onGameCompletedPressed: () {},
      winsText: 'cognitive.gameTicTacToe.winsText'.tr(),
      drawsText: 'cognitive.gameTicTacToe.drawsText'.tr(),
      lossesText: 'cognitive.gameTicTacToe.lossesText'.tr(),
      gameTurnMessage: gameNotifier.isPlaying()
          ? gameNotifier.isPlayerTurn()
              ? 'cognitive.gameTicTacToe.playerTurn'.tr()
              : 'cognitive.gameTicTacToe.opponentTurn'.tr()
          : 'cognitive.gameTicTacToe.gameOver'.tr(),
      gameStatusMessage: ticTacToeGetGameStatusText(game.status).tr(),
    );
  }
}
