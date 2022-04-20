import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/font_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/buttons/circle_button.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/action_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/panels/base_panel.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class GameInstructionsScreenLayout extends StatelessWidget {
  final String title;
  final String instructions;
  final List<Widget> actions;
  final VoidCallback? onPressed;

  const GameInstructionsScreenLayout(
      {Key? key,
      this.actions = const [],
      this.onPressed,
      this.title = '',
      this.instructions = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionScreenLayout(title: title, content: [
      Expanded(
          child: BasePanel(
        children: [
          AutoSizeText(
            'cognitive.gameInstructions'.tr(),
            style: TextStyle(
                fontSize: FontConstants.fontSizeM, fontWeight: FontWeight.w800),
            minFontSize: FontConstants.fontSizeS,
            maxFontSize: FontConstants.fontSizeL,
            maxLines: 1,
          ),
          Expanded(
              child: Center(
            child: Markdown(
              data: instructions,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                  .copyWith(textScaleFactor: 1.2),
            ),
          ))
          // AutoSizeText(
          //   instructions,
          //   style: TextStyle(fontSize: FontConstants.fontSizeM),
          //   minFontSize: FontConstants.fontSizeS,
          //   maxFontSize: FontConstants.fontSizeL,
          //   textAlign: TextAlign.justify,
          // )
        ],
      ))
    ], screenActions: [
      Expanded(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleButton(
              onPressed: onPressed,
              primaryColor: AppTheme.blue,
              icon: Icons.play_arrow)
        ],
      ))
    ]);
  }
}
