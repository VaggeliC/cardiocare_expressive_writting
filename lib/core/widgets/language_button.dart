import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utilities/app_theme.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.language, size: 32, color: AppTheme.black),
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 'en', child: Text('@.capitalize:language.english'.tr())),
        PopupMenuItem(
            value: 'el', child: Text('@.capitalize:language.greek'.tr())),
      ],
      onSelected: (newValue) async {
        if (newValue == 'el') {
          await context.setLocale(const Locale('el'));
        } else {
          await context.setLocale(const Locale('en'));
        }
      },
    );
  }
}
