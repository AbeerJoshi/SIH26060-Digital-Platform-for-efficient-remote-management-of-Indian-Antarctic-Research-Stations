import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/heimdall_top_bar.dart';
import '../../widgets/station_map_card.dart';
import '../../widgets/alerts_panel.dart';
import '../../widgets/weather_bar.dart';
import '../../widgets/bar_stat_card.dart';
import '../../widgets/status_lines_card.dart';
import '../../widgets/prediction_card.dart';
import '../../widgets/voyage_card.dart';

class HqDashboardScreen extends StatefulWidget {
  const HqDashboardScreen({super.key});

  @override
  State<HqDashboardScreen> createState() => _HqDashboardScreenState();
}

class _HqDashboardScreenState extends State<HqDashboardScreen> {
  String _selectedKey = 'BHARATI';

  @override
  Widget build(BuildContext context) {
    final selected = _selectedKey == 'MAITRI' ? maitriData : bharatiData;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeimdallTopBar(interfaceLabel: 'HEADQUARTER\nINTERFACE'),
              const SizedBox(height: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: StationMapCard(
                      selectedStation: _selectedKey,
                      onSelect: (key) => setState(() => _selectedKey = key),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: AlertsPanel(bharati: bharatiData, maitri: maitriData),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${selected.name} - Selected station',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(child: WeatherBar(readout: selected.weatherReadout)),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: BarStatCard(title: 'Power lines', stats: selected.powerLines)),
                  const SizedBox(width: 24),
                  Expanded(
                    child: StatusLinesCard(
                      title: 'Reports - Power lines',
                      sectionLabel: 'Depletion',
                      lines: selected.powerLineReports,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: BarStatCard(title: 'Supply', stats: selected.supply)),
                  const SizedBox(width: 24),
                  Expanded(
                    child: StatusLinesCard(
                      title: 'Reports & Predictions - Supply',
                      sectionLabel: 'Depletion',
                      lines: selected.supplyReports,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: BarStatCard(title: 'Annual Restock', stats: selected.restock)),
                  const SizedBox(width: 24),
                  Expanded(
                    child: PredictionCard(
                      title: 'Insights & Predictions - Annual Restock',
                      prediction: selected.restockPrediction,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: VoyageCard(station: selected)),
                  const SizedBox(width: 24),
                  Expanded(
                    child: PredictionCard(
                      title: 'Fuel Burn Rate - Insights & Predictions',
                      prediction: selected.fuelBurnPrediction,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}