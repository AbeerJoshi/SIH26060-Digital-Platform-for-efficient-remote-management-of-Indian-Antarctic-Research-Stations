import 'package:flutter/material.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';
import 'status_tile.dart';

/// The HQ "ALERTS" grid — two columns (Bharati / Maitri), three rows
/// (Fuel / Satellite link / Distress).
class AlertsPanel extends StatelessWidget {
  final StationData bharati;
  final StationData maitri;

  const AlertsPanel({super.key, required this.bharati, required this.maitri});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ALERTS',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(child: _ColumnHeader('BHARATI')),
            Expanded(child: _ColumnHeader('MAITRI')),
          ],
        ),
        const SizedBox(height: 12),
        _AlertRow(label: 'Fuel', left: bharati.fuelAlert, right: maitri.fuelAlert),
        const SizedBox(height: 16),
        _AlertRow(
          label: 'Satellite link',
          left: bharati.satelliteAlert,
          right: maitri.satelliteAlert,
        ),
        const SizedBox(height: 16),
        _AlertRow(
          label: 'Distress',
          left: bharati.distressAlert,
          right: maitri.distressAlert,
        ),
      ],
    );
  }
}

class _ColumnHeader extends StatelessWidget {
  final String label;
  const _ColumnHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w800,
        fontSize: 15,
      ),
    );
  }
}

class _AlertRow extends StatelessWidget {
  final String label;
  final AlertReading left;
  final AlertReading right;

  const _AlertRow({required this.label, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: StatusTile(label: left.label, level: left.level)),
            const SizedBox(width: 12),
            Expanded(child: StatusTile(label: right.label, level: right.level)),
          ],
        ),
      ],
    );
  }
}