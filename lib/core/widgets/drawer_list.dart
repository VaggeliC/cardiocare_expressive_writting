import 'package:flutter/material.dart';

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    required this.icon,
    required this.index,
    this.imageName = '',
  });

  String labelName;
  Icon icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex index;
}

enum DrawerIndex {
  home,
  mobility,
  cognitive,
  education,
  geriatric,
  vision,
  psychology,
  about
}