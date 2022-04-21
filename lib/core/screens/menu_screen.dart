import 'package:cardiocare_expressive_writting/psychology/menu/screens/psychology_menu_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/buttons/card_button.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/grids/card_grid.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/screen_layout.dart';
import 'package:cardiocare_expressive_writting/core/widgets/language_button.dart';
import 'package:cardiocare_expressive_writting/geriatric/menu/screens/geriatric_menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../cognitive/menu/screens/cognitive_menu_screen.dart';
import '../../geriatric/incontinence/screens/pelvicexercises.dart';
import '../utilities/app_theme.dart';
import '../widgets/drawer_list.dart';

/* Menu-task Screen Class*/
class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

//build the ui of the dashboard
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppTheme.background,
        child: ListView(padding: EdgeInsets.zero, children: [
          SizedBox(
            height: 250,
          ),
          Divider(
            height: 30,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          setListTile("Home", Icons.home),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("Mobility & Vitality", Icons.watch),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("Cognitive Stimulation", Icons.psychology),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("Education & Training", Icons.school),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("Geriatric Syndromes\n Assessment", Icons.note_alt),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("Vision & Hearing", Icons.hearing),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("Psychology & Wellbeing", Icons.question_answer),
          Padding(padding: EdgeInsets.all(4)),
          setListTile("About", Icons.info),
          Divider(
            height: 320,
            color: AppTheme.grey.withOpacity(0.8),
          ),
        ]),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.black),
        backgroundColor: AppTheme.background,
        centerTitle: true,
        title: Text(
          "CardioCare",
          style: TextStyle(
            fontSize: 30,
            color: AppTheme.black,
          ),
        ),
        actions: [
          appBarIcon((Icon(Icons.notifications))),
          LanguageButton(),
          // appBarIcon((Icon(Icons.language))),
        ],
      ),
      backgroundColor: AppTheme.background,
      body: Column(children: [
        //Space from appbar
        Padding(padding: EdgeInsets.all(20)),
        Text("core.header",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: AppTheme.grey,
                    fontWeight: FontWeight.bold))
            .tr(),
        //Space
        Padding(padding: EdgeInsets.all(10)),
        //containers in order to set height & width of the cards
        SizedBox(
          height: 110,
          child: customCard("core.questionnaires".tr(), Icons.note_alt),
        ),
        //containers in order to set height & width of the cards
        SizedBox(
          height: 110,
          child: customCard("Nutrition", Icons.restaurant),
        ),
        SizedBox(
          height: 110,
          child: customCard("Physical Activity", Icons.watch),
        ),

        SizedBox(
          height: 10,
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                      child: CardGrid(
                    portraitCells: 3,
                    // spacing: 10,
                    //add card buttons
                    children: [
                      CardButton(
                        onPressed: () {},
                        label: 'Mobility \n& \nVitality',
                        primaryColor: AppTheme.green,
                      ),
                      CardButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      CognitiveMenuScreen())));
                        },
                        label: 'Cognitive Stimulation \n & \n Training',
                        primaryColor: AppTheme.brown,
                      ),
                      // Padding(padding: EdgeInsets.all(1)),
                      CardButton(
                        onPressed: () {},
                        label: 'Education & \nTraining',
                        primaryColor: AppTheme.red,
                      ),
                      // SizedBox(width: 3.5),
                      CardButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      GeriatricMenuScreen())));
                        },
                        labelSize: 17.8,
                        label: 'Geriatric Syndromes\nAssessment',
                        primaryColor: AppTheme.orange,
                      ),

                      CardButton(
                        onPressed: () {},
                        label: 'Vision\n & \nHearing',
                        primaryColor: AppTheme.blue,
                      ),

                      CardButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      PsychologyMenuScreen())));
                        },
                        label: 'Psychology\n& \nWellbeing',
                        labelSize: 19,
                        primaryColor: AppTheme.purple,
                      ),
                    ],
                  ))
                ]),
          ),
        )
      ]),
    );
  }

  //Task Cards
  Widget customCard(String txt, IconData icon) {
    return Card(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: AppTheme.white,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ListTile(
          trailing: LayoutBuilder(builder: (ctx, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                right: 2.5,
                top: 15.0,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 35,
                color: AppTheme.blue,
              ),
            );
          }),
          title: Text(
            txt,
            textAlign: TextAlign.start,
            style: TextStyle(height: 2, fontSize: 30, color: AppTheme.black),
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 30.0, top: 20),
            child: Icon(icon, size: 35, color: AppTheme.black),
            // onTap: (){},
          ),
        ));
  }

  Widget appBarIcon(Icon icon) {
    return IconButton(
      padding: EdgeInsets.all(0),
      onPressed: () {},
      icon: icon,
      color: AppTheme.black,
      iconSize: 32,
    );
  }

  //drawer ListTile
  Widget setListTile(String txt, IconData icon) {
    return ListTile(
      title: Text(txt,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: AppTheme.black)),
      leading: Icon(
        icon,
        color: AppTheme.black,
        size: 30,
      ),
      onTap: () {},
    );
  }

  DrawerList customDrawerList(DrawerIndex index, String txt, IconData icon) {
    return DrawerList(
      index: index,
      labelName: txt,
      icon: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
