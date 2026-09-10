import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// "HIVE/Live Comms field" card — the static inter-base message log
/// shown verbatim from the Figma frame.
class HiveCommsCard extends StatelessWidget {
  const HiveCommsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'HIVE/Live Comms field - ',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: 'Inter-base comms client',
                  style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            style: TextStyle(color: AppColors.textPrimary, fontSize: 17),
          ),
          const SizedBox(height: 18),
          _logLine('#*48 :', 'Researcher MT72 to document necessary logs of Leg II logistics arrival. Confirm.'),
          const SizedBox(height: 10),
          _logLine('#*49 :', 'Affirm conversation 48. Closed.'),
          const SizedBox(height: 10),
          const Text('------', style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 10),
          _logLine('#*50 :', 'Researcher BH41 to document shortage of research vehicles. Confirm.'),
        ],
      ),
    );
  }

  Widget _logLine(String tag, String body) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$tag ', style: const TextStyle(fontWeight: FontWeight.w800)),
          TextSpan(text: body, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, height: 1.4),
    );
  }
}