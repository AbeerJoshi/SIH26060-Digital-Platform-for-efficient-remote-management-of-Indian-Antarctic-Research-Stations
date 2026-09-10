import 'package:flutter/material.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// "Voyages - Route, ETA, Cargo Manifest" card: plain route/leg text,
/// then a green current-status + next-window line.
class VoyageCard extends StatelessWidget {
  final StationData station;

  const VoyageCard({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Voyages - Route, ETA, Cargo Manifest',
          style: TextStyle(
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
              for (var i = 0; i < station.voyageLines.length; i++) ...[
                if (i > 0) const SizedBox(height: 14),
                Text(
                  station.voyageLines[i],
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Text(
                station.voyageStatus,
                style: const TextStyle(
                  color: AppColors.statusOk,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                station.voyageWindow,
                style: const TextStyle(
                  color: AppColors.statusOk,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}