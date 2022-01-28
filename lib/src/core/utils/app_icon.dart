import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { SVG, PNG }
Widget AppIcon(
    {required String assetName,
    double iconSize = 28.0,
    VoidCallback? onPressed,
    double padding = 8.0,
    ImageType imageType = ImageType.SVG}) {
  return imageType == ImageType.SVG
      ? IconButton(
          padding: EdgeInsets.all(padding),
          constraints: BoxConstraints(),
          icon: SvgPicture.asset(
            assetName,
            width: iconSize - 8,
            height: iconSize - 8,
          ),
          onPressed: onPressed,
          iconSize: iconSize,
        )
      : GestureDetector(
          onTap: onPressed,
          child: Image.asset(
            assetName,
            fit: BoxFit.cover,
            height: iconSize,
            width: iconSize,
          ));
}
