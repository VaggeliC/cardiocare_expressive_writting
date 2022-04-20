import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/game_instructions_screen_layout.dart';
import 'package:flutter/material.dart';

class BeansStartScreen extends StatelessWidget {
  const BeansStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameInstructionsScreenLayout(
        title: 'cognitive.gameColorBeans.title'.tr(),
        instructions: 'cognitive.gameColorBeans.instructions'.tr(),
        onPressed: () {});
  }
}
