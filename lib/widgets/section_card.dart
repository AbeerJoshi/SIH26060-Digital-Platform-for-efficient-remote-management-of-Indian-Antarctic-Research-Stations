import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Shared rounded dark card shell used by every stat/report/prediction
/// panel on the HQ and Base dashboards.
class SectionCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const SectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}