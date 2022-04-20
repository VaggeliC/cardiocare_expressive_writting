import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/game_instructions_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/drawing/screens/drawing_game_screen.dart';
import 'package:flutter/material.dart';

class DrawingStartScreen extends StatelessWidget {
  const DrawingStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameInstructionsScreenLayout(
      title: 'cognitive.gameDrawing.title'.tr(),
      instructions: 'cognitive.gameDrawing.instructions'.tr(),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => DrawingGameScreen())));
      },
    );
    // return ActionScreenLayout(
    //   title: 'cognitive.gameDrawing.title'.tr(),
    //   content: [
    //     Expanded(child: Container(color: Colors.amber)),
    //     Expanded(child: Container(color: Colors.blueAccent))
    //   ],
    //   screenActions: [
    //     Expanded(child: Container(color: Colors.deepOrangeAccent)),
    //     Expanded(child: Container(color: Colors.tealAccent))
    //   ],
    // );

    // return CognitiveGameStartScreen(
    //   'cognitive.gameDrawing.title'.tr(),
    //   instructions: 'cognitive.gameDrawing.instructions'.tr(),
    //   onPressed: () {},
    // );
  }
}
