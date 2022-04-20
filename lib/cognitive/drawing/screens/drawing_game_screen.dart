import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawingGameScreen extends HookConsumerWidget {
  const DrawingGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blue,
    );
    // return GameInstructionsScreenLayout(
    //     title: 'cognitive.gameDrawing.title'.tr(),
    //     instructions: 'cognitive.gameDrawing.instructions'.tr(),
    //     onPressed: () {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: ((context) => DrawingGameScreen())));
    //     });
  }
}
