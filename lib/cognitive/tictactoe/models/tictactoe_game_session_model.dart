import 'package:cardiocare_expressive_writting/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tictactoe_game_session_model.freezed.dart';

@freezed
class TicTacToeGameSessionModel with _$TicTacToeGameSessionModel {
  const factory TicTacToeGameSessionModel(
          {@Default(TicTacToePlayerType.none) TicTacToePlayerType playerTurn}) =
      _TicTacToeGameSessionModel;
}
