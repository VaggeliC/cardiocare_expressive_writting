import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/tictactoe/models/tictactoe_game_model.dart';

class TicTacToeGameListNotifier
    extends BaseGameListNotifier<TicTacToeGameModel> {
  TicTacToeGameListNotifier({List<TicTacToeGameModel>? initialState})
      : super(initialState);
}
