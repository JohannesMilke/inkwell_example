import 'package:flutter/material.dart';

class CustomBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => CustomBorder();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) =>
      _buildPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) =>
      _buildPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final path = _buildPath(rect);

    canvas.drawPath(path, Paint());
  }

  Path _buildPath(Rect rect) {
    final size = rect.size;
    final double width = 50;
    final double depth = 40;

    final path = Path()

      /// top
      ..lineTo(size.width / 2 - width / 2, 0)
      ..relativeQuadraticBezierTo(width / 2, depth, width, 0)
      ..lineTo(size.width, 0)

      /// right
      ..lineTo(size.width, size.height / 2 - width / 2)
      ..relativeQuadraticBezierTo(-depth, width / 2, 0, width)
      ..lineTo(size.width, size.height)

      /// bottom
      ..lineTo(size.width / 2 + width / 2, size.height)
      ..relativeQuadraticBezierTo(-width / 2, -depth, -width, 0)
      ..lineTo(0, size.height)

      /// left
      ..lineTo(0, size.height / 2 + width / 2)
      ..relativeQuadraticBezierTo(depth, -width / 2, 0, -width)
      ..lineTo(0, 0)
      ..close();

    return path;
  }
}
