import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/context/find_word_game_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/models/find_word_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final findWordGameListProvider =
    StateNotifierProvider<FindWordGameListNotifier, List<FindWordGameModel>>(
        (ref) => FindWordGameListNotifier());

final findWordActiveGameProvider =
    StateNotifierProvider<FindWordGameNotifier, FindWordGameModel>(
        (ref) => FindWordGameNotifier(ref, findWordGameListProvider));
