import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';
import 'status_tile.dart';

/// The Base interface "COMMUNICATIONS" grid.
class CommunicationsPanel extends StatelessWidget {
  const CommunicationsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'COMMUNICATIONS',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Inter-base Communications',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: StatusTile(label: baseOutboundLink.label, level: baseOutboundLink.level)),
            const SizedBox(width: 12),
            Expanded(child: StatusTile(label: baseInboundLink.label, level: baseInboundLink.level)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _LabeledTile(label: 'Satellite link', reading: baseSatelliteLink)),
            const SizedBox(width: 12),
            Expanded(child: _LabeledTile(label: 'Sync status', reading: baseSyncStatus)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _LabeledTile(label: 'Distress', reading: baseDistress)),
            const SizedBox(width: 12),
            Expanded(child: _LabeledTile(label: 'System', reading: baseSystemStatus)),
          ],
        ),
      ],
    );
  }
}

class _LabeledTile extends StatelessWidget {
  final String label;
  final AlertReading reading;

  const _LabeledTile({required this.label, required this.reading});

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
        StatusTile(label: reading.label, level: reading.level),
      ],
    );
  }
}