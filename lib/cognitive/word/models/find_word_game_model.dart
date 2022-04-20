import 'dart:math';

import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_model.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_new_puzzle.dart';
import 'package:flutter/gestures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_word_game_model.freezed.dart';

@freezed
class FindWordGameModel with BaseGameModel, _$FindWordGameModel {
  @Implements<BaseGameModel>()
  const factory FindWordGameModel({
    @Default(GameStatusType.none) GameStatusType status,
    DateTime? startTime,
    DateTime? endTime,
    double? minResponseTime,
    double? maxResponseTime,
    double? avgResponseTime,
    @Default(findWordDefaultRows) int rows,
    @Default(findWordDefaultColumns) int columns,
    @Default([]) List<String> words,
    FindWordNewPuzzle? puzzle,
    Point<int>? selectedStartTile,
    Point<int>? selectedEndTile,
    // int? selectedCellStart,
    // int? selectedCellEnd,
    Offset? dragStart,
    Offset? dragEnd,
  }) = _FindWordGameModel;
}
