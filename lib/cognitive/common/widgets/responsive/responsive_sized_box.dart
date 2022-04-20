import 'package:flutter/material.dart';

class ResponsiveSizedBox extends StatelessWidget {
  final bool visible;
  final double? width;
  final double? height;

  const ResponsiveSizedBox({
    Key? key,
    this.width,
    this.height,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return Container();
    }
    return OrientationBuilder(
      builder: (context, orientation) => SizedBox(
        width: orientation == Orientation.portrait ? null : width,
        height: orientation == Orientation.portrait ? height : null,
      ),
    );
  }
}
