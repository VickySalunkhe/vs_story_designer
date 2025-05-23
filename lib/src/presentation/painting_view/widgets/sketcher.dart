import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:vs_story_designer/src/domain/models/painting_model.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/painting_type.dart';

class Sketcher extends CustomPainter {
  final List<PaintingModel> lines;

  Sketcher({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    List<Offset>? outlinePoints;

    for (int i = 0; i < lines.length; ++i) {
      switch (lines[i].paintingType) {
        case PaintingType.pen:
          paint = Paint()..color = lines[i].lineColor;

          outlinePoints = getStroke(

              /// coordinates
              lines[i].points,
              options: StrokeOptions(
                /// line width
                size: lines[i].size,

                /// line thin
                thinning: 1,

                /// line smooth
                smoothing: 1,

                /// on complete line
                isComplete: lines[i].isComplete,
                streamline: 1,
                simulatePressure: true,
                // taperEnd: 0,
                // taperStart: 0,
                // capStart: true,
                // capEnd: true,
              ));
          break;
        case PaintingType.marker:
          paint = Paint()
            ..strokeWidth = 5
            ..color = lines[i].lineColor.withValues(alpha: 0.7)
            ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 5)
            ..strokeCap = StrokeCap.square
            ..filterQuality = FilterQuality.high
            ..style = PaintingStyle.fill;
          outlinePoints = getStroke(

              /// coordinates
              lines[i].points,
              options: StrokeOptions(
                /// line width
                size: lines[i].size,

                /// line thin
                thinning: 1,

                /// line smooth
                smoothing: 1,

                /// on complete line
                isComplete: lines[i].isComplete,
              ));
          break;
        case PaintingType.neon:
          paint = Paint()
            ..strokeWidth = 5
            ..color = lines[i].lineColor
            ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 5)
            ..strokeJoin = StrokeJoin.round
            ..strokeCap = StrokeCap.round
            ..strokeMiterLimit = 5
            ..filterQuality = FilterQuality.high
            ..style = PaintingStyle.stroke;

          outlinePoints = getStroke(

              /// coordinates
              lines[i].points,
              options: StrokeOptions(
                /// line width
                size: lines[i].size,

                /// line thin
                thinning: -0.1,

                /// line smooth
                smoothing: 1,

                /// on complete line
                isComplete: lines[i].isComplete,
                streamline: lines[i].streamline,
                simulatePressure: lines[i].simulatePressure,
                // taperStart: 0,
                // taperEnd: 0,
                // capStart: true,
                // capEnd: true
              ));
          break;
      }

      final path = Path();

      if (outlinePoints.isEmpty) {
        return;
      } else if (outlinePoints.length < 2) {
        /// If the path only has one line, draw a dot.
        path.addOval(Rect.fromCircle(
            center: Offset(outlinePoints[0].dx, outlinePoints[0].dy),
            radius: 1));
      } else {
        /// Otherwise, draw a line that connects each point with a curve.
        path.moveTo(outlinePoints[0].dx, outlinePoints[0].dy);

        for (int i = 1; i < outlinePoints.length - 1; ++i) {
          final p0 = outlinePoints[i];
          final p1 = outlinePoints[i + 1];
          path.quadraticBezierTo(
              p0.dx, p0.dy, (p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
        }
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}
