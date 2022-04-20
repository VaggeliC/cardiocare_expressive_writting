import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/beans/screens/beans_start_screen.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/spacing_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/buttons/card_button.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/grids/card_grid.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/action_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/panels/key_value_panel.dart';
import 'package:cardiocare_expressive_writting/cognitive/drawing/screens/drawing_start_screen.dart';
//import 'package:epsycheart/cognitive/tictactoe/screens/tictactoe_report_screen.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/screens/word_start_screen.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class CognitiveMenuScreen extends StatelessWidget {
  const CognitiveMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionScreenLayout(
      title: 'cognitive.menu.title'.tr(),
      flexContentArea: 60,
      flexActionsArea: 40,
      verticalAreaSpacing: SpacingConstants.spacingXXL,
      content: const [
        Expanded(
            child: KeyValuePanel(
          title: 'Game Statistics',
          data: {
            'Games played': '3',
            'Games won': '1',
            'Games lost': '1',
            'Games draws': '1'
          },
        ))
      ],
      screenActions: [
        Expanded(
            child: CardGrid(
          children: [
            CardButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WordStartScreen())));
              },
              icon: Icons.grid_on,
              label: 'cognitive.gameWord.title'.tr(),
              primaryColor: AppTheme.blue,
            ),
            // CardButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             //builder: ((context) => TicTacToeReportScreen())));
            //   },
            //   icon: Icons.tag,
            //   label: 'cognitive.gameTicTacToe.title'.tr(),
            //   primaryColor: AppTheme.green,
            // ),
            CardButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => BeansStartScreen())));
              },
              icon: Icons.group_work_outlined,
              label: 'cognitive.gameColorBeans.title'.tr(),
              primaryColor: AppTheme.red,
            ),
            CardButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DrawingStartScreen())));
              },
              icon: Icons.brush_outlined,
              label: 'cognitive.gameDrawing.title'.tr(),
              primaryColor: AppTheme.purple,
            ),
            // CardButton(
            //   onPressed: () {},
            //   icon: Icons.question_mark_outlined,
            //   label: 'cognitive.gameQuestion.title'.tr(),
            //   primaryColor: AppTheme.pink,
            // ),
          ],
        ))
      ],
    );
  }
}
