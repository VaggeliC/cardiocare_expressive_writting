import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/game_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_providers.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_utilities.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_utils.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/widgets/find_word_game_board.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordGameScreen extends HookConsumerWidget {
  const WordGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(findWordActiveGameProvider);
    final gameNotifier = ref.read(findWordActiveGameProvider.notifier);

    return GameScreenLayout(
        title: 'cognitive.gameWord.title'.tr(),
        gameListProvider: findWordGameListProvider,
        gameArea: Center(child: FindWordGameBoard()),
        onRestartPressed: () {
          final words = findWordRandomWords();

          gameNotifier.initialize(FindWordInitializeParams(
              words: words,
              defaultLetters: 'cognitive.gameWord.defaultLetters'.tr()));
        },
        onGameCompletedPressed: () {},
        winsText: 'cognitive.gameWord.winsText'.tr(),
        lossesText: 'cognitive.gameWord.lossesText'.tr(),
        showDraws: false,
        gameTurnMessage: game.words.isNotEmpty ? game.words[0] : '',
        gameStatusMessage: findWordGetGameStatusText(game.status).tr());
  }
}
