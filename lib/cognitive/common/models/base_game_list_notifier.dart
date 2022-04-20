import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_model.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_model_extensions.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseGameListNotifier<T extends BaseGameModel>
    extends StateNotifier<List<T>> {
  BaseGameListNotifier(List<T>? initialState) : super(initialState ?? []);

  int get totalGameTime =>
      state.fold(0, (sum, game) => sum + game.gameTimeInMSecs());

  int get totalWins =>
      state.where((game) => game.status == GameStatusType.won).length;

  int get totalDraws =>
      state.where((game) => game.status == GameStatusType.draw).length;

  int get totalLosses =>
      state.where((game) => game.status == GameStatusType.lost).length;

  double get totalMinResponseTime =>
      state.fold(0, (sum, game) => (sum + (game.minResponseTime ?? 0)) / 2);

  double get totalMaxResponseTime =>
      state.fold(0, (sum, game) => (sum + (game.maxResponseTime ?? 0)) / 2);

  double get totalAvgResponseTime =>
      state.fold(0, (sum, game) => (sum + (game.avgResponseTime ?? 0)) / 2);

  void add(T game) {
    state = [...state, game];
  }

  void clear() {
    state = [];
  }
}
