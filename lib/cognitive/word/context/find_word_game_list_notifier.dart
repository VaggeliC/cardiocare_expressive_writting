import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/models/find_word_game_model.dart';

class FindWordGameListNotifier extends BaseGameListNotifier<FindWordGameModel> {
  FindWordGameListNotifier({List<FindWordGameModel>? initialState})
      : super(initialState);
}
