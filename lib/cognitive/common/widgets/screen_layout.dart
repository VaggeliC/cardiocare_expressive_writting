import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:cardiocare_expressive_writting/core/widgets/language_button.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final List<Widget> children;

  const ScreenLayout({Key? key, this.children = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppTheme.black),
          backgroundColor: AppTheme.background,
          centerTitle: true,
          title: Text(
            "app.title".tr(),
            style: TextStyle(
              fontSize: 30,
              color: AppTheme.black,
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.notifications),
              color: AppTheme.black,
              iconSize: 32,
            ),
            LanguageButton(),
          ],
        ),
        body: SafeArea(
            maintainBottomViewPadding: false,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: OrientationBuilder(
                    builder: (BuildContext context, Orientation orientation) {
                  if (orientation == Orientation.portrait) {
                    return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: children);
                  }

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  );
                }))));
  }
}
