import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import '../calendar/size.dart' as s;

class BackgroundCircle extends StatelessWidget {
  late final double _height;
  late final double _width;

  late final bool _right;
  late final bool _reverse;

  BackgroundCircle({
    required double height,
    required double width,
    bool right = true,
    bool reverse = false,
  }) {
    this._height = height;
    this._right = right;
    this._width = width;
    this._reverse = reverse;
  }

  @override
  Widget build(BuildContext context) {
    s.Size _size = new s.Size(context);
    return Opacity(
      opacity: 0.9,
      child: Container(
        height: _size.height(_height),
        width: _size.width(_width),
        child: CustomPaint(
          painter: _CirclePainter(
            _size.height(_height),
            _size.width(_width),
            _right,
            _reverse,
          ),
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double _radius = 313;
  final double _height;
  final double _width;
  final bool _right;
  final bool _reverse;
  _CirclePainter(this._height, this._width, this._right, this._reverse);
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = _right
        ? Offset((s.Size.modelWidth - _width) + _radius, _height - _radius)
        : Offset(_width - _radius, _height - _radius);
    canvas.drawCircle(
      center,
      _radius,
      Paint()
        ..shader = LinearGradient(
          colors: _reverse
              ?const [
          // Color.fromRGBO(54, 213, 152, 1),
          //   Color.fromRGBO(26, 185, 124, 1),
            primaryGreenColor_1,
            primaryGreenColor_1
          ].reversed.toList()
              :const [
            primaryGreenColor_1,
            primaryGreenColor_1
    //     Color.fromRGBO(54, 213, 152, 1),
    // Color.fromRGBO(26, 185, 124, 1),
      ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(
          Rect.fromCircle(center: center, radius: _radius),
        ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
