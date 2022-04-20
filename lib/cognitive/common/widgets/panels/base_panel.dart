import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class BasePanel extends StatelessWidget {
  final List<Widget> children;

  const BasePanel({Key? key, this.children = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1)),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: children)));
  }
}
