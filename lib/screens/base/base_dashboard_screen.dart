import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/heimdall_top_bar.dart';
import '../../widgets/station_map_card.dart';
import '../../widgets/communications_panel.dart';
import '../../widgets/weather_bar.dart';
import '../../widgets/telemetry_radial.dart';
import '../../widgets/section_card.dart';
import '../../widgets/upload_report_card.dart';
import '../../widgets/hive_comms_card.dart';
import '../../widgets/data_forensics_log.dart';

class BaseDashboardScreen extends StatefulWidget {
  const BaseDashboardScreen({super.key});

  @override
  State<BaseDashboardScreen> createState() => _BaseDashboardScreenState();
}

class _BaseDashboardScreenState extends State<BaseDashboardScreen> {
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
              const HeimdallTopBar(interfaceLabel: 'BASE\nINTERFACE'),
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
                  const Expanded(flex: 2, child: CommunicationsPanel()),
                ],
              ),
              const SizedBox(height: 32),
              WeatherBar(readout: '${selected.name} Station   ·   ${selected.weatherReadout}'),
              const SizedBox(height: 32),
              const Text(
                'Telemetry',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              const SectionCard(child: TelemetryRadial()),
              const SizedBox(height: 32),
              const Text(
                'Technical Communications',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: UploadReportCard()),
                  SizedBox(width: 24),
                  Expanded(child: HiveCommsCard()),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Data Forensics Log - Action queues based on predictions and HIVE retained data.",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              const DataForensicsLog(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}