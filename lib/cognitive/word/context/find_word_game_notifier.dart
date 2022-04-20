import 'dart:math';

import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_providers.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/models/find_word_game_model.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/types/find_word_types.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_engine.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_location.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_settings.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_solved.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindWordGameNotifier extends BaseGameNotifier<FindWordGameModel,
    FindWordGameListNotifier, FindWordInitializeParams, void> {
  final FindWordEngine _engine;

  FindWordSolved _solution;

  FindWordSolved get solution => _solution;

  FindWordGameNotifier(
      Ref ref,
      StateNotifierProvider<FindWordGameListNotifier, List<FindWordGameModel>>
          gameListProvider,
      {FindWordGameModel? initialState})
      : _engine = FindWordEngine(),
        _solution = FindWordSolved(),
        super(ref, gameListProvider, initialState ?? FindWordGameModel());

  void setSelectedStartTile(Point<int> tile) {
    state = state.copyWith(selectedStartTile: tile);
  }

  void setSelectedEndTile(Point<int> tile) {
    Future.microtask(() async {
      state = state.copyWith(selectedEndTile: tile);

      await play(null);
    });
  }

  void setDragPositions(Offset start, Offset end) {
    state = state.copyWith(dragStart: start, dragEnd: end);
  }

  void setStartDragPosition(Offset position) {
    state = state.copyWith(dragStart: position);
  }

  void setStartEndPosition(Offset position) {
    state = state.copyWith(dragEnd: position);
  }

  void resetDragPositions() {
    state = state.copyWith(dragStart: null, dragEnd: null);
  }

  @override
  void initialize(FindWordInitializeParams params) {
    final settings = FindWordSettings(
        width: params.columns,
        height: params.rows,
        orientations: [FindWordOrientation.verticalUp]);

    final newPuzzle = _engine.newPuzzle(params.words, settings,
        defaultLetters: params.defaultLetters);

    _solution = _engine.solvePuzzle(newPuzzle.puzzle, params.words);

    state = FindWordGameModel().copyWith(
        startTime: DateTime.now(),
        words: params.words,
        rows: params.rows,
        columns: params.columns,
        puzzle: newPuzzle,
        status: GameStatusType.playing);
  }

  @override
  bool isPlaying() => state.status == GameStatusType.playing;

  @override
  Future playTurn(void params) async {
    FindWordLocation loc = _solution.found.first;

    int startIndex = point2DTo1DIndex(Point(loc.x, loc.y), state.columns);
    int endIndex = point2DTo1DIndex(Point(loc.endX, loc.endY), state.columns);
    int selectedStartIndex =
        point2DTo1DIndex(state.selectedStartTile!, state.columns);
    int selectedEndIndex =
        point2DTo1DIndex(state.selectedEndTile!, state.columns);

    var status = state.status;
    DateTime? endTime;

    if (startIndex == selectedStartIndex && endIndex == selectedEndIndex) {
      status = GameStatusType.won;
      endTime = DateTime.now();
    } else {
      ref
          .read(findWordGameListProvider.notifier)
          .add(state.copyWith(status: GameStatusType.lost));
    }

    state = state.copyWith(status: status, endTime: endTime);
  }
}

class FindWordInitializeParams {
  final List<String> words;
  final String defaultLetters;
  final int rows;
  final int columns;

  const FindWordInitializeParams(
      {this.words = const [],
      this.defaultLetters = findWordDefaultLetters,
      this.rows = findWordDefaultRows,
      this.columns = findWordDefaultColumns});
}
