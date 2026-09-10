import 'package:flutter/material.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';

/// Small colored pill tile used by both the HQ Alerts grid and the
/// Base Communications grid.
class StatusTile extends StatelessWidget {
  final String label;
  final StatusLevel level;

  const StatusTile({super.key, required this.label, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: statusColor(level).withOpacity(0.16),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: statusColor(level), width: 1.2),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: statusColor(level),
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}