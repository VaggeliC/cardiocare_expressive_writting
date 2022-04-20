import 'package:cardiocare_expressive_writting/cognitive/common/constants/spacing_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/appbar/base_appbar.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/responsive/responsive_row_or_col.dart';
import 'package:flutter/material.dart';

class BaseScreenLayout extends StatelessWidget {
  final List<Widget> appbarActions;
  final List<Widget> children;
  final bool responsive;

  const BaseScreenLayout({
    Key? key,
    this.children = const [],
    this.appbarActions = const [],
    this.responsive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: BaseAppBar(
          actions: appbarActions,
        ),
        body: SafeArea(
            maintainBottomViewPadding: false,
            child: Padding(
                padding: EdgeInsets.all(SpacingConstants.spacingM),
                child: ResponsiveRowOrCol(
                    responsive: responsive, children: children))));
  }
}
