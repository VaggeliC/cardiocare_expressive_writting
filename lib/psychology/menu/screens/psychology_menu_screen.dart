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
            'Feeling overwhelmed by the Cancer? \n\n               Expressive Writing can Help',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          height: 100,
        ),
        SizedBox(
          child: Text(
            '\nWhat is Expressive Writing?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          child: Text(
            '\nExpressive writing is easy. Just sit down and write about something that is bothering you. It’s simple and there is no right or wrong way to do it.\n\nThis application gives you some ways to try out expressive writing to help you deal with the Cancer outbreak. By writing about your thoughts and feelings for as little as 5-10 minutes, you may change the ways you are thinking, feeling, and even sleeping.',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          child: Text(
            '\nWhat are the Benefits of Expressive Writing?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          //height: 100,
        ),
        SizedBox(
          child: Text(
            '\nExpressive writing has been around for over 30 years. Hundreds of experiments have demonstrated its effectiveness in improving people’s mental and physical health. By putting emotional upheavals into words, we start to understand them better. Once we have a better handle on our problems, we can move forward and get on with life.\n\nThese pages were designed as coping tools for people who are trying to deal with the Cancer outbreak. In reality, expressive writing can work for any issues you may be thinking or worrying about - major or minor.',
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
