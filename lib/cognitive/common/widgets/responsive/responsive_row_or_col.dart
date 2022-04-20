import 'package:flutter/material.dart';

class ResponsiveRowOrCol extends StatelessWidget {
  final List<Widget> children;
  final MainAxisSize portraitMainAxisSize;
  final MainAxisAlignment portraitMainAxisAlignment;
  final CrossAxisAlignment portraitCrossAxisAlignment;
  final MainAxisSize landscapeMainAxisSize;
  final MainAxisAlignment landscapeMainAxisAlignment;
  final CrossAxisAlignment landscapeCrossAxisAlignment;
  final Orientation switchToRowOrientation;
  final bool responsive;

  const ResponsiveRowOrCol({
    Key? key,
    this.switchToRowOrientation = Orientation.landscape,
    this.children = const [],
    this.portraitMainAxisSize = MainAxisSize.max,
    this.portraitMainAxisAlignment = MainAxisAlignment.start,
    this.portraitCrossAxisAlignment = CrossAxisAlignment.stretch,
    this.landscapeMainAxisSize = MainAxisSize.max,
    this.landscapeMainAxisAlignment = MainAxisAlignment.start,
    this.landscapeCrossAxisAlignment = CrossAxisAlignment.stretch,
    this.responsive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == switchToRowOrientation && responsive) {
          return Row(
              mainAxisSize: landscapeMainAxisSize,
              mainAxisAlignment: landscapeMainAxisAlignment,
              crossAxisAlignment: landscapeCrossAxisAlignment,
              children: children);
        }

        return Column(
            mainAxisSize: portraitMainAxisSize,
            mainAxisAlignment: portraitMainAxisAlignment,
            crossAxisAlignment: portraitCrossAxisAlignment,
            children: children);
      },
    );
  }
}
