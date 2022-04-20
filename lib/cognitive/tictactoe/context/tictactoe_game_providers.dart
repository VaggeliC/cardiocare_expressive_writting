import 'package:cardiocare_expressive_writting/cognitive/tictactoe/context/tictactoe_game_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/context/tictactoe_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/models/tictactoe_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ticTacToeGameListProvider =
    StateNotifierProvider<TicTacToeGameListNotifier, List<TicTacToeGameModel>>(
        (ref) => TicTacToeGameListNotifier());

final ticTacToeActiveGameProvider =
    StateNotifierProvider<TicTacToeGameNotifier, TicTacToeGameModel>(
        (ref) => TicTacToeGameNotifier(ref, ticTacToeGameListProvider));
