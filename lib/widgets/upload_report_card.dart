import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'section_card.dart';

/// "Upload report NCPOR" card — the button opens the offline-sync
/// confirmation dialog described in the Figma frame.
class UploadReportCard extends StatelessWidget {
  const UploadReportCard({super.key});

  void _showStoredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'REPORT STORED IN HIVE',
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800),
        ),
        content: const Text(
          'FLUSHES AUTOMATICALLY WHEN MQTT CLIENTS ARE AVAILABLE.',
          style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: AppColors.barFill)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload report NCPOR',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 18),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '* Satellite communications unavailable',
                  style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: ' - MQTT Client',
                  style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            style: TextStyle(color: AppColors.statusAlert, fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            '*Uploaded report shall be clustered in HIVE.',
            style: TextStyle(
              color: AppColors.statusAlert,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: ElevatedButton(
              onPressed: () => _showStoredDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cardBackgroundAlt,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Upload report', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}