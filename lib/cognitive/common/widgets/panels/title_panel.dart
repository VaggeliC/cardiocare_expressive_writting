import 'package:auto_size_text/auto_size_text.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/font_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/panels/base_panel.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class TitlePanel extends StatelessWidget {
  final String title;

  const TitlePanel({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePanel(
      children: [
        Center(
            child: AutoSizeText(
          title,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: FontConstants.fontSizeL, color: AppTheme.black),
          minFontSize: FontConstants.fontSizeS,
          maxFontSize: FontConstants.fontSizeXL,
        ))
      ],
    );
  }
}
