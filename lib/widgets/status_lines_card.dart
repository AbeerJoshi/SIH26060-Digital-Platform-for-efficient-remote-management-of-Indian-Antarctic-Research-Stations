import 'package:flutter/material.dart';
import '../models/station_data.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// Titled card of status lines under an underlined section label
/// (e.g. "Depletion") — used for both "Reports" panels.
class StatusLinesCard extends StatelessWidget {
  final String title;
  final String sectionLabel;
  final List<StatusLine> lines;

  const StatusLinesCard({
    super.key,
    required this.title,
    required this.sectionLabel,
    required this.lines,
  });

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
              Text(
                sectionLabel,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 14),
              for (var i = 0; i < lines.length; i++) ...[
                if (i > 0) const SizedBox(height: 12),
                Text(
                  lines[i].text,
                  style: TextStyle(
                    color: statusColor(lines[i].level),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}