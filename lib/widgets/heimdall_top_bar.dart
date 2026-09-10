import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Shared top bar: interface label top-left, "HEIMDALL" centered,
/// profile icon top-right. Reused by HQ and Base dashboards.
class HeimdallTopBar extends StatelessWidget {
  final String interfaceLabel; // 'HEADQUARTER\nINTERFACE' or 'BASE\nINTERFACE'

  const HeimdallTopBar({super.key, required this.interfaceLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            interfaceLabel,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'HEIMDALL',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w900,
                fontSize: 26,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.cardBackgroundAlt,
              child: const Icon(Icons.person, color: AppColors.textPrimary, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}