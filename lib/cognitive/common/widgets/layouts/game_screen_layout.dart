import 'package:auto_size_text/auto_size_text.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/font_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_list_notifier.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/models/base_game_model.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/buttons/circle_button.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/action_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/responsive/responsive_row_or_col.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameScreenLayout<
    TGame extends BaseGameModel,
    TGamesProvider extends StateNotifierProvider<BaseGameListNotifier<TGame>,
        List<TGame>>> extends HookConsumerWidget {
  final String title;
  final TGamesProvider gameListProvider;
  final Widget? gameArea;
  final VoidCallback? onRestartPressed;
  final VoidCallback? onGameCompletedPressed;
  final String gameTurnMessage;
  final String gameStatusMessage;
  final String winsText;
  final String lossesText;
  final String drawsText;
  final bool? showWins;
  final bool? showDraws;
  final bool? showLosses;

  const GameScreenLayout({
    Key? key,
    this.title = '',
    required this.gameListProvider,
    this.onRestartPressed,
    this.onGameCompletedPressed,
    this.gameArea,
    this.gameTurnMessage = '',
    this.gameStatusMessage = '',
    this.winsText = '',
    this.lossesText = '',
    this.drawsText = '',
    this.showWins = true,
    this.showDraws = true,
    this.showLosses = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameListNotifier = ref.read(gameListProvider.notifier);

    return ActionScreenLayout(
      title: title,
      content: [
        Expanded(
            child: ResponsiveRowOrCol(
          children: [
            Expanded(
                flex: 30,
                child: Column(
                  children: [
                    if (showDraws! || showWins! || showLosses!)
                      Expanded(
                          flex: 40,
                          child: Row(
                            children: [
                              if (showWins!)
                                Expanded(
                                    child: Column(children: [
                                  AutoSizeText(winsText,
                                      maxLines: 1,
                                      minFontSize: FontConstants.fontSizeS,
                                      maxFontSize: FontConstants.fontSizeM),
                                  AutoSizeText(
                                      gameListNotifier.totalWins.toString(),
                                      maxLines: 1,
                                      minFontSize: FontConstants.fontSizeS,
                                      maxFontSize: FontConstants.fontSizeM)
                                ])),
                              if (showDraws!)
                                Expanded(
                                    child: Column(children: [
                                  AutoSizeText(drawsText,
                                      maxLines: 1,
                                      minFontSize: FontConstants.fontSizeS,
                                      maxFontSize: FontConstants.fontSizeM),
                                  AutoSizeText(
                                      gameListNotifier.totalDraws.toString(),
                                      maxLines: 1,
                                      minFontSize: FontConstants.fontSizeS,
                                      maxFontSize: FontConstants.fontSizeM)
                                ])),
                              if (showLosses!)
                                Expanded(
                                    child: Column(children: [
                                  AutoSizeText(lossesText,
                                      maxLines: 1,
                                      minFontSize: FontConstants.fontSizeS,
                                      maxFontSize: FontConstants.fontSizeM),
                                  AutoSizeText(
                                      gameListNotifier.totalLosses.toString(),
                                      maxLines: 1,
                                      minFontSize: FontConstants.fontSizeS,
                                      maxFontSize: FontConstants.fontSizeM)
                                ]))
                            ],
                          )),
                    Expanded(
                      flex: 30,
                      child: Center(
                          child: AutoSizeText(
                        gameTurnMessage,
                        textAlign: TextAlign.center,
                        minFontSize: FontConstants.fontSizeS,
                        maxFontSize: FontConstants.fontSizeL,
                        presetFontSizes: [FontConstants.fontSizeL],
                      )),
                    ),
                    Expanded(
                      flex: 30,
                      child: AutoSizeText(
                        gameStatusMessage,
                        textAlign: TextAlign.center,
                        minFontSize: FontConstants.fontSizeS,
                        maxFontSize: FontConstants.fontSizeL,
                        presetFontSizes: [FontConstants.fontSizeL],
                      ),
                    )
                  ],
                )),
            if (gameArea != null) Expanded(flex: 70, child: gameArea!)
          ],
        ))
      ],
      screenActions: [
        CircleButton(
            onPressed: onRestartPressed,
            primaryColor: AppTheme.blue,
            icon: Icons.refresh),
        CircleButton(
            onPressed: onGameCompletedPressed,
            primaryColor: AppTheme.green,
            icon: Icons.check)
      ],
    );
  }
}
