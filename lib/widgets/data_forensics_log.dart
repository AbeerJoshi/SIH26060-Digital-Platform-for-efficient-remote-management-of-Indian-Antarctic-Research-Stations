import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// "Data Forensics Log" card — Immediate / Snooze action queues, shown
/// verbatim from the Figma frame with CRITICAL bolded inline.
class DataForensicsLog extends StatelessWidget {
  const DataForensicsLog({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            const TextSpan(
              children: [
                TextSpan(text: 'Immediate', style: TextStyle(fontWeight: FontWeight.w800)),
                TextSpan(text: " - Class 'Projection'", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
          ),
          const SizedBox(height: 10),
          _bullet('Models suggest audits on fuel consumption. Check Renewables.'),
          _bullet('Models suggest audits on Medics. Unusually high usage of PPEs.'),
          _bulletWithCritical('Models suggest ', 'CRITICAL', " audits on drills' availability."),
          const SizedBox(height: 24),
          Text.rich(
            const TextSpan(
              children: [
                TextSpan(text: 'Snooze', style: TextStyle(fontWeight: FontWeight.w800)),
                TextSpan(text: " - Class 'Hive data retention analysis'", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
          ),
          const SizedBox(height: 10),
          _bullet('Rations & Hygiene in check'),
          _bullet('Generators audits suggested. CVG-4 Generator under maintenance.'),
          _bulletWithCritical('Retained data suggests ', 'CRITICAL', ' audits on Research Equipments.'),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '•  $text',
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _bulletWithCritical(String pre, String critical, String post) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: '•  '),
            TextSpan(text: pre, style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
            TextSpan(text: critical, style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w900)),
            TextSpan(text: post, style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
          ],
        ),
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4),
      ),
    );
  }
}