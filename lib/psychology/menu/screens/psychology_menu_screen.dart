import 'package:cardiocare_expressive_writting/psychology/expressive_writing/screens/expressive_writing_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/buttons/card_button.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/grids/card_grid.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/panels/title_panel.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/screen_layout.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';


class PsychologyMenuScreen extends StatelessWidget {
  const PsychologyMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      children: [
        Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitlePanel(title: 'geriatric.menu.title'.tr()),
            ]),
        SizedBox(
          height: 150,
        ),

        // card grid
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: CardGrid(
              portraitCells: 2,
              // spacing: 8,
              children: [
                CardButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ExpressiveWritingScreen())));
                  },
                  icon: Icons.create_sharp,
                  label: 'geriatric.menu.expressive_writing'.tr(),
                  primaryColor: AppTheme.green,
                ),
                // CardButton(
                //   onPressed: () {},
                //   icon: Icons.directions_walk,
                //   label: 'Falls Mitigation',
                //   primaryColor: AppTheme.purple,
                // ),
              ],
            ))
          ],
        ))
      ],
    );
  }
}
