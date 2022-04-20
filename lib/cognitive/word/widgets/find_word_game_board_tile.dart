import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/font_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_providers.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_utils.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindWordGameBoardTile extends HookConsumerWidget {
  final String letter;
  final Point<int> tileData;

  const FindWordGameBoardTile({
    Key? key,
    required this.letter,
    required this.tileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(findWordActiveGameProvider);
    final notifier = ref.read(findWordActiveGameProvider.notifier);
    // final tileIndex = point2DTo1DIndex(tileData, game.columns);

    return Draggable(
        data: tileData,
        feedback: Container(),
        child: DragTarget<Point<int>>(onAccept: (data) {
          if (!notifier.isPlaying()) {
            return;
          }

          notifier.setSelectedStartTile(data);
          notifier.setSelectedEndTile(tileData);

          // final startIndex = point2DTo1DIndex(data, game.columns);
          // notifier.setStartCell(startIndex);
          // notifier.setEndCell(tileIndex);
        }, builder: ((context, candidateData, rejectedData) {
          final tileFound = game.status == GameStatusType.won &&
              isPointOnLine(
                  game.selectedStartTile, game.selectedEndTile, tileData);
          return DecoratedBox(
              decoration: BoxDecoration(
                  color: tileFound ? AppTheme.blue : AppTheme.white,
                  border: Border.all(color: AppTheme.black, width: 0.1)),
              child: Center(
                  child: AutoSizeText(
                letter,
                style: TextStyle(
                    fontSize: FontConstants.fontSizeXL,
                    color: tileFound ? AppTheme.white : AppTheme.black),
                minFontSize: FontConstants.fontSizeS,
                maxFontSize: FontConstants.fontSizeL,
                maxLines: 1,
                textAlign: TextAlign.center,
              )));
        })));
  }
}
