import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/font_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/constants/spacing_constants.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:cardiocare_expressive_writting/core/widgets/language_button.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar(
      {Key? key,
      String? title,
      List<Widget> actions = const [],
      bool useDefaultActions = true})
      : super(
            key: key,
            iconTheme: IconThemeData(color: AppTheme.black),
            backgroundColor: AppTheme.background,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: FontConstants.fontSizeXXL,
                ),
                SizedBox(
                    width: SpacingConstants.spacingM,
                    height: SpacingConstants.spacingM),
                Expanded(
                    child: AutoSizeText(
                  (title ?? 'app.title').tr(),
                  style: TextStyle(
                      fontSize: FontConstants.fontSizeXL,
                      color: AppTheme.black),
                  minFontSize: FontConstants.fontSizeS,
                  maxFontSize: FontConstants.fontSizeXL,
                  maxLines: 1,
                ))
              ],
            ),
            actions: useDefaultActions
                ? [...actions, ..._buildDefaultActions()]
                : _buildDefaultActions());

  static List<Widget> _buildDefaultActions() {
    return [
      IconButton(
        padding: EdgeInsets.all(SpacingConstants.spacingNone),
        onPressed: () {},
        icon: Icon(Icons.notifications),
        iconSize: FontConstants.fontSizeXL,
      ),
      LanguageButton(),
    ];
  }
}
