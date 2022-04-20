import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_model.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseGameNotifier<
    TGame extends BaseGameModel,
    TGameListNotifier extends BaseGameListNotifier<TGame>,
    TInitializeParams,
    TPlayParams> extends StateNotifier<TGame> {
  final StateNotifierProvider<TGameListNotifier, List<TGame>> gameListProvider;
  final Ref ref;
  BaseGameNotifier(this.ref, this.gameListProvider, TGame state) : super(state);

  bool isPlaying();

  Future playTurn(TPlayParams params);

  void initialize(TInitializeParams params);

  Future play(TPlayParams params) async {
    await playTurn(params);

    if (List<GameStatusType>.from(
            [GameStatusType.draw, GameStatusType.lost, GameStatusType.won])
        .contains(state.status)) {
      final notifier = ref.read(gameListProvider.notifier);

      notifier.add(state);
    }
  }
}
