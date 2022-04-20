import 'package:cardiocare_expressive_writting/cognitive/common/constants/spacing_constants.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/layouts/base_screen_layout.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/panels/title_panel.dart';
import 'package:cardiocare_expressive_writting/cognitive/common/widgets/responsive/responsive_sized_box.dart';
import 'package:flutter/material.dart';

class ActionScreenLayout extends StatelessWidget {
  final List<Widget> appbarActions;
  final List<Widget> screenActions;
  final List<Widget> content;
  final bool responsive;
  final String title;
  final int flexContentArea;
  final int flexActionsArea;
  final double horizontalAreaSpacing;
  final double verticalAreaSpacing;

  const ActionScreenLayout(
      {Key? key,
      this.appbarActions = const [],
      this.screenActions = const [],
      this.content = const [],
      this.responsive = true,
      this.title = '',
      this.flexContentArea = 75,
      this.flexActionsArea = 25,
      this.horizontalAreaSpacing = SpacingConstants.spacingM,
      this.verticalAreaSpacing = SpacingConstants.spacingM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titlePanel = TitlePanel(
      title: title,
    );

    return OrientationBuilder(builder: (context, orientation) {
      final actionsContainer = Expanded(
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: screenActions));

      final leftArea = Expanded(
          flex: orientation == Orientation.portrait
              ? flexContentArea
              : flexActionsArea,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: SpacingConstants.spacingM),
                  child: titlePanel),
              ResponsiveSizedBox(
                  visible: (orientation == Orientation.landscape &&
                          content.isNotEmpty) ||
                      (orientation == Orientation.portrait &&
                          screenActions.isNotEmpty),
                  width: SpacingConstants.spacingM,
                  height: SpacingConstants.spacingM),
              if (orientation == Orientation.landscape) actionsContainer,
              if (orientation == Orientation.portrait) ...content
            ],
          ));

      final rightArea = Expanded(
          flex: orientation == Orientation.portrait
              ? flexActionsArea
              : flexContentArea,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (orientation == Orientation.landscape) ...content,
              if (orientation == Orientation.portrait) actionsContainer
            ],
          ));

      final separator = ResponsiveSizedBox(
          visible: (orientation == Orientation.landscape &&
                  screenActions.isNotEmpty) ||
              (orientation == Orientation.portrait && content.isNotEmpty),
          width: horizontalAreaSpacing,
          height: verticalAreaSpacing);

      return BaseScreenLayout(
          appbarActions: appbarActions,
          responsive: responsive,
          children: orientation == Orientation.portrait
              ? [leftArea, separator, rightArea]
              : [rightArea, separator, leftArea]);
    });
  }
}
