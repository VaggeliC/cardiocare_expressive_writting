import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/game_instructions_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/context/tictactoe_game_providers.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/screens/tictactoe_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicTacToeStartScreen extends HookConsumerWidget {
  const TicTacToeStartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameInstructionsScreenLayout(
        title: 'cognitive.gameTicTacToe.title'.tr(),
        instructions: 'cognitive.gameTicTacToe.instructions'.tr(),
        onPressed: () {
          // reset game
          ref.read(ticTacToeActiveGameProvider.notifier).initialize(null);

          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => TicTacToeGameScreen())));
        });
  }
}
