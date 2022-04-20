import 'package:auto_size_text/auto_size_text.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/font_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/panels/base_panel.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class KeyValuePanel extends StatelessWidget {
  final String title;
  final Map<String, String> data;

  const KeyValuePanel({Key? key, this.data = const {}, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entries = data.entries
        .map(
          (e) => Flexible(
              child: Row(
            children: [
              Expanded(
                  child: AutoSizeText(
                e.key,
                maxLines: 1,
                minFontSize: FontConstants.fontSizeS,
                maxFontSize: FontConstants.fontSizeL,
              )),
              Expanded(
                  child: AutoSizeText(
                e.value,
                maxLines: 1,
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w500),
                minFontSize: FontConstants.fontSizeS,
                maxFontSize: FontConstants.fontSizeL,
              ))
            ],
          )),
        )
        .toList();

    return BasePanel(children: [
      AutoSizeText(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style:
            TextStyle(fontSize: FontConstants.fontSizeL, color: AppTheme.black),
        minFontSize: FontConstants.fontSizeS,
        maxFontSize: FontConstants.fontSizeXL,
      ),
      ...entries
    ]);
  }
}
