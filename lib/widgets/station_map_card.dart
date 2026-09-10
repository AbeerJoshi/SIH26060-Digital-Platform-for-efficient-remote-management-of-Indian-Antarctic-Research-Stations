import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A stylized stand-in for the Figma satellite/graticule map — concentric
/// polar rings on a teal gradient, with tappable Maitri/Bharati pins.
/// Swap the CustomPaint background for the real map image asset later;
/// the pin positions and tap handling stay the same.
class StationMapCard extends StatelessWidget {
  final String selectedStation; // 'BHARATI' or 'MAITRI'
  final ValueChanged<String> onSelect;

  const StationMapCard({
    super.key,
    required this.selectedStation,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 16 / 11,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(child: CustomPaint(painter: _PolarMapPainter())),
                _pin(constraints, dx: 0.32, dy: 0.16, label: 'Maitri', stationKey: 'MAITRI'),
                _pin(constraints, dx: 0.66, dy: 0.47, label: 'Bharati', stationKey: 'BHARATI'),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _pin(
      BoxConstraints constraints, {
        required double dx,
        required double dy,
        required String label,
        required String stationKey,
      }) {
    final selected = stationKey == selectedStation;
    return Positioned(
      left: constraints.maxWidth * dx,
      top: constraints.maxHeight * dy,
      child: GestureDetector(
        onTap: () => onSelect(stationKey),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.circle,
              size: 8,
              color: selected ? AppColors.statusOk : AppColors.textPrimary,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.statusOk : AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PolarMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = const RadialGradient(
      colors: [AppColors.mapIce, AppColors.mapWaterDeep],
      radius: 1.1,
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    final center = Offset(size.width * 0.5, size.height * 0.52);
    final maxRadius = size.shortestSide * 0.46;
    final ringPaint = Paint()
      ..color = Colors.white.withOpacity(0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (var i = 1; i <= 3; i++) {
      canvas.drawCircle(center, maxRadius * (i / 3), ringPaint);
    }
    canvas.drawLine(Offset(center.dx, 0), Offset(center.dx, size.height), ringPaint);
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), ringPaint);

    final landPaint = Paint()..color = Colors.white.withOpacity(0.06);
    final landPath = Path()
      ..moveTo(size.width * 0.15, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.35, size.height * 0.30, size.width * 0.55, size.height * 0.40)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.50, size.width * 0.80, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.85, size.width * 0.15, size.height * 0.55)
      ..close();
    canvas.drawPath(landPath, landPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}