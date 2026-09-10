import 'package:flutter/material.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// Titled card of labeled horizontal progress bars — used for
/// "Power lines", "Supply", and "Annual Restock".
class BarStatCard extends StatelessWidget {
  final String title;
  final List<BarStat> stats;

  const BarStatCard({super.key, required this.title, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < stats.length; i++) ...[
                if (i > 0) const SizedBox(height: 18),
                _BarRow(stat: stats[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _BarRow extends StatelessWidget {
  final BarStat stat;
  const _BarRow({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stat.label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(height: 12, color: AppColors.barTrack),
                  Container(
                    height: 12,
                    width: constraints.maxWidth * stat.percent.clamp(0.0, 1.0),
                    color: AppColors.barFill,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}