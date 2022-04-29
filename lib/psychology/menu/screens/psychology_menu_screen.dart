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
              TitlePanel(title: 'psychology.menu.title'.tr()),
            ]),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          child: Text(
            'psychology.menu.header'.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          height: 120,
        ),
        SizedBox(
          child: Text(
            'psychology.menu.subheader1'.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          child: Text(
            'psychology.menu.text1'.tr(),
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          child: Text(
            'psychology.menu.subheader2'.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          child: Text(
            'psychology.menu.text2'.tr(),
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          height: 20,
        ),
        // card grid
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: CardGrid(
              portraitCells: 1,
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
                  label: 'psychology.menu.expressiveWriting'.tr(),
                  primaryColor: AppTheme.blue,
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
