import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';

import '../calendar/size.dart';

class BackgroundSheet extends StatelessWidget {
  late final double _width;
  late final double _height;
  late final BorderRadius? _borderRadius;
  late final Color? _color;

  BackgroundSheet({
    double? width,
    double? height,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    this._borderRadius = borderRadius;
    this._color = color;
    this._height = height ?? 463;
    this._width = width ?? 428;
  }
  @override
  Widget build(BuildContext context) {
    Size _size = new Size(context);
    return Container(
      width: _size.width(_width),
      height: _size.height(_height),
      decoration: BoxDecoration(
        borderRadius: _borderRadius ??
            BorderRadius.only(
              bottomLeft: Radius.circular(_size.width(80)),
              bottomRight: Radius.circular(_size.width(80)),
            ),
        gradient: _color != null
            ? null
            :const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryGreenColor_1,
                  primaryGreenColor_1,],
          //Color.fromRGBO(54, 213, 152, 1)
              ),
        color: _color,
      ),
    );
  }
}
