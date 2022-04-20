import 'package:cardiocare_expressive_writting/cognitive/common/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  final List<Widget> children;
  final int portraitCells;
  final int landscapeCells;

  const CardGrid(
      {Key? key,
      this.children = const [],
      this.portraitCells = 3,
      this.landscapeCells = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        int count = orientation == Orientation.landscape
            ? landscapeCells
            : portraitCells;

        return GridView.count(
            crossAxisCount: count,
            childAspectRatio: 1.0,
            mainAxisSpacing: SpacingConstants.spacingM,
            crossAxisSpacing: SpacingConstants.spacingM,
            children: children);
      },
    );
  }
}
