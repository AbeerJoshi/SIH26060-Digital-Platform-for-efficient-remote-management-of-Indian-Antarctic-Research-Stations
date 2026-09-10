import 'package:flutter/material.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// "Predictions [ALERT]" card — one or more colored headline lines, then
/// a "Projections:" bullet list. Bullets read plain white when every
/// headline is OK, and inherit the alert color otherwise.
class PredictionCard extends StatelessWidget {
  final String title;
  final PredictionBlock prediction;

  const PredictionCard({super.key, required this.title, required this.prediction});

  @override
  Widget build(BuildContext context) {
    final projectionsColor =
    prediction.isAlert ? AppColors.statusAlert : AppColors.textPrimary;

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
              const Text(
                'Predictions [ALERT]',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 14),
              for (var i = 0; i < prediction.headlines.length; i++) ...[
                if (i > 0) const SizedBox(height: 8),
                Text(
                  prediction.headlines[i].text,
                  style: TextStyle(
                    color: statusColor(prediction.headlines[i].level),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ],
              const SizedBox(height: 14),
              Text(
                'Projections:',
                style: TextStyle(
                  color: projectionsColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              for (final line in prediction.projections)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 8),
                  child: Text(
                    '•  $line',
                    style: TextStyle(
                      color: projectionsColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}