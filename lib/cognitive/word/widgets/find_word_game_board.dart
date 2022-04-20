import 'dart:math';

import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_providers.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/widgets/find_word_game_board_tile.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/widgets/line_painter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindWordGameBoard extends HookConsumerWidget {
  const FindWordGameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(findWordActiveGameProvider);
    final notifier = ref.watch(findWordActiveGameProvider.notifier);

    return AspectRatio(
        aspectRatio: 1,
        child: Listener(
            onPointerDown: (event) {
              if (!notifier.isPlaying()) {
                return;
              }

              notifier.setStartDragPosition(event.localPosition);
            },
            onPointerMove: (event) {
              if (!notifier.isPlaying()) {
                return;
              }
              notifier.setStartEndPosition(event.localPosition);
            },
            onPointerUp: (event) {
              if (!notifier.isPlaying()) {
                return;
              }
              notifier.resetDragPositions();
            },
            child: Stack(children: [
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                      game.rows,
                      (row) => Expanded(
                              child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(game.columns, (column) {
                              final letter = game.puzzle?.puzzle[row][column]
                                      .toUpperCase() ??
                                  '';

                              return Expanded(
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: FindWordGameBoardTile(
                                        letter: letter,
                                        tileData: Point<int>(column, row),
                                      )));
                            }),
                          )))),
              if (notifier.isPlaying())
                IgnorePointer(
                    child: CustomPaint(
                        painter: LinePainter(
                            strokeWidth: 15,
                            start: game.dragStart,
                            end: game.dragEnd)))
            ])));
  }
}
