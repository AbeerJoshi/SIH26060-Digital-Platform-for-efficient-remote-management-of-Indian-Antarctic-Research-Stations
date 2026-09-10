import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// The Base interface "Telemetry" quadrant diagram — outer ring holds
/// the routine categories, inner ring holds whatever's currently
/// flagged red across those categories. Positions are fixed to match
/// the Figma frame; this snapshot reflects Maitri's current flags
/// (Drills, Medics, Renewables) and isn't wired to the map selector.
class TelemetryRadial extends StatelessWidget {
  const TelemetryRadial({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1261 / 663,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(child: CustomPaint(painter: _RingsPainter())),
              _label(constraints, 0.359, 0.237, 'Vehicles .', AppColors.textPrimary, alignRight: true),
              _label(constraints, 0.316, 0.363, 'Research Equipments .', AppColors.textPrimary, alignRight: true),
              _label(constraints, 0.639, 0.216, '. Rations', AppColors.textPrimary),
              _label(constraints, 0.657, 0.397, '. Hygiene', AppColors.textPrimary),
              _label(constraints, 0.470, 0.480, 'Drills .', AppColors.statusAlert, bold: true, italic: true, alignRight: true),
              _label(constraints, 0.571, 0.409, '.Medics', AppColors.statusAlert, bold: true, italic: true),
              _label(constraints, 0.591, 0.602, '.Renewables', AppColors.statusAlert, bold: true, italic: true),
              _label(constraints, 0.680, 0.658, '. Diesel Generators', AppColors.textPrimary),
              _label(constraints, 0.406, 0.833, 'Leg II .', AppColors.textPrimary, alignRight: true),
              _label(constraints, 0.657, 0.824, '. Co-Generators', AppColors.textPrimary),
            ],
          );
        },
      ),
    );
  }

  Widget _label(
      BoxConstraints c,
      double dx,
      double dy,
      String text,
      Color color, {
        bool bold = false,
        bool italic = false,
        bool alignRight = false,
      }) {
    return Positioned(
      left: alignRight ? null : c.maxWidth * dx,
      right: alignRight ? c.maxWidth * (1 - dx) : null,
      top: c.maxHeight * dy,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _RingsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.53, size.height * 0.50);
    final outerRadius = size.height * 0.46;
    final innerRadius = size.height * 0.20;

    final ringFill = Paint()..color = AppColors.cardBackgroundAlt;
    final ringStroke = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawCircle(center, outerRadius, ringFill);
    canvas.drawCircle(center, outerRadius, ringStroke);
    canvas.drawCircle(center, innerRadius, Paint()..color = AppColors.panelBackground);
    canvas.drawCircle(center, innerRadius, ringStroke);

    canvas.drawLine(Offset(center.dx, center.dy - outerRadius), Offset(center.dx, center.dy + outerRadius), ringStroke);
    canvas.drawLine(Offset(center.dx - outerRadius, center.dy), Offset(center.dx + outerRadius, center.dy), ringStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}