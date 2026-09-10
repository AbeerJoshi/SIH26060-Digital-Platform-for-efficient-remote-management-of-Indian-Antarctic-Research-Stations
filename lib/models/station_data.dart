import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum StatusLevel { ok, warn, alert }

Color statusColor(StatusLevel level) {
  switch (level) {
    case StatusLevel.ok:
      return AppColors.statusOk;
    case StatusLevel.warn:
      return AppColors.statusWarn;
    case StatusLevel.alert:
      return AppColors.statusAlert;
  }
}

/// One row inside a bar-graph card, e.g. "Diesel generators" at 78%.
class BarStat {
  final String label;
  final double percent; // 0.0 - 1.0
  const BarStat(this.label, this.percent);
}

/// One line inside a "Reports" card, e.g. "Diesel generators: Status [OK]".
class StatusLine {
  final String text;
  final StatusLevel level;
  const StatusLine(this.text, this.level);
}

/// A "Predictions [ALERT]" block: one or more colored headline lines,
/// then bullet projections. Bullets read plain white when every headline
/// is OK, and inherit the alert color when any headline is flagged.
class PredictionBlock {
  final List<StatusLine> headlines;
  final List<String> projections;

  const PredictionBlock({
    required this.headlines,
    required this.projections,
  });

  bool get isAlert => headlines.any((h) => h.level != StatusLevel.ok);
}

/// One tile inside the HQ "Alerts" grid or Base "Communications" grid.
class AlertReading {
  final String label;
  final StatusLevel level;
  const AlertReading(this.label, this.level);
}

class StationData {
  final String name;
  final String latLon;

  final List<BarStat> powerLines;
  final List<StatusLine> powerLineReports;

  final List<BarStat> supply;
  final List<StatusLine> supplyReports;

  final List<BarStat> restock;
  final PredictionBlock restockPrediction;

  final List<String> voyageLines;
  final String voyageStatus;
  final String voyageWindow;

  final PredictionBlock fuelBurnPrediction;

  final AlertReading fuelAlert;
  final AlertReading satelliteAlert;
  final AlertReading distressAlert;

  final String weatherReadout;

  const StationData({
    required this.name,
    required this.latLon,
    required this.powerLines,
    required this.powerLineReports,
    required this.supply,
    required this.supplyReports,
    required this.restock,
    required this.restockPrediction,
    required this.voyageLines,
    required this.voyageStatus,
    required this.voyageWindow,
    required this.fuelBurnPrediction,
    required this.fuelAlert,
    required this.satelliteAlert,
    required this.distressAlert,
    required this.weatherReadout,
  });
}