import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// The long horizontal placeholder bar beneath the station title —
/// filled with a live-style weather/physical readout per station.
class WeatherBar extends StatelessWidget {
  final String readout;

  const WeatherBar({super.key, required this.readout});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.placeholderBox,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        readout,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}