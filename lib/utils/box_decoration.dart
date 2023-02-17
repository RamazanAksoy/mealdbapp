import 'package:flutter/material.dart';
import 'package:mealdbapp/core/constants/themes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

BoxDecoration customBoxDecoration({
  Color color = Colors.white,
  bool hasShadow = false,
  double borderRadius = 0,
  BorderBox? borderBox,
  ImageProvider<Object>? image,
  BoxFit? fit = BoxFit.contain,
}) =>
    BoxDecoration(
        image: image != null ? DecorationImage(image: image, fit: fit) : null,
        color: color,
        border: borderBox != null
            ? Border.all(
                color: borderBox.color ?? Colors.black,
                width: borderBox.width ?? 1,
                style: borderBox.style ?? BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                    color: Colors.black54.withOpacity(0.3),
                    blurRadius: 0.001,
                    offset: Offset(0.0, 0.1))
              ]
            : []);

            BoxDecoration youtubeBoxDecoration({
  Color color = AppColors.red,
  bool hasShadow = false,
  double borderRadius = 4,
  BorderBox? borderBox,
  ImageProvider<Object>? image,
  BoxFit? fit = BoxFit.contain,
}) =>
    BoxDecoration(
        image: image != null ? DecorationImage(image: image, fit: fit) : null,
        color: color,
        border: borderBox != null
            ? Border.all(
                color: borderBox.color ?? Colors.black,
                width: borderBox.width ?? 1,
                style: borderBox.style ?? BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                    color: Colors.black54.withOpacity(0.3),
                    blurRadius: 0.001,
                    offset: Offset(0.0, 0.1))
              ]
            : []);

class BorderBox {
  BorderBox({this.color, this.width, this.style});

  Color? color;
  double? width;
  BorderStyle? style;
}
