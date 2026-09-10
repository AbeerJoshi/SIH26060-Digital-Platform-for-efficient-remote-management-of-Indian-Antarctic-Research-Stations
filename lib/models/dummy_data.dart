import 'station_data.dart';

/// All numbers here are demo data only — no backend, no real telemetry.
/// Bar percentages are read off the Figma frames; the three "Alert" tiles
/// per station (fuel / satellite / distress) and the weather readout were
/// blank placeholders in the design, so they're filled here consistent
/// with the narrative each station's own reports already tell.

final StationData bharatiData = StationData(
  name: 'BHARATI',
  latLon: '69°S, 76°E',
  powerLines: const [
    BarStat('Diesel generators', 0.78),
    BarStat('Co-generators', 0.92),
    BarStat('Renewables', 0.38),
  ],
  powerLineReports: const [
    StatusLine('Diesel generators: Status [OK]', StatusLevel.ok),
    StatusLine('Co-generators: Status [OK]', StatusLevel.ok),
    StatusLine('Renewables: Status [OK]', StatusLevel.ok),
  ],
  supply: const [
    BarStat('Rations', 0.72),
    BarStat('Hygiene & Waste', 0.82),
    BarStat('PPE & Pharma', 0.46),
  ],
  supplyReports: const [
    StatusLine('Rations : Status [OK] - Last voyage - 63d', StatusLevel.ok),
    StatusLine('Hygiene: Status [OK] - Last audit - 42d', StatusLevel.ok),
    StatusLine('Medics: Status [OK] - Last audit - 42d', StatusLevel.ok),
  ],
  restock: const [
    BarStat('Vehicle', 0.08),
    BarStat('Research Equipment', 0.70),
    BarStat('Drills & Samples', 0.50),
  ],
  restockPrediction: const PredictionBlock(
    headlines: [
      StatusLine('Critically running out of Vehicles.', StatusLevel.alert),
    ],
    projections: [
      'Multi-axle trucks unusable in 77d.',
      '0.14x more damage to be faced by trucks in blizzard season. ALLOCATION NEEDED.',
    ],
  ),
  voyageLines: const [
    'Leg I (Cape Town to Bharati): Takes 10 to 12 days by chartered ice-class ships.',
    'Leg II (Bharati to Maitri): Covering the roughly 3,000 km distance between the two stations along the coast in 5 to 7 days, depending on weather and sea-ice.',
  ],
  voyageStatus: 'CURRENT STATUS: OPEN',
  voyageWindow: 'Next best window: 2 Nov - 6 Nov',
  fuelBurnPrediction: const PredictionBlock(
    headlines: [
      StatusLine('Rate of depletion: DETECTED [OK]', StatusLevel.ok),
      StatusLine('Energy Lines: STATUS [OK]', StatusLevel.ok),
    ],
    projections: [
      'Heavy energy usage anticipated next month',
      'Commencement of life sciences field operations',
    ],
  ),
  fuelAlert: const AlertReading('NOMINAL', StatusLevel.ok),
  satelliteAlert: const AlertReading('STRONG · -58 dBm', StatusLevel.ok),
  distressAlert: const AlertReading('NONE', StatusLevel.ok),
  weatherReadout:
  '-14°C   ·   Wind 42 km/h   ·   Lake Temp 1.2°C   ·   Humidity 58%   ·   Sat Link -73 dBm',
);

final StationData maitriData = StationData(
  name: 'MAITRI',
  latLon: '70°S, 11°E',
  powerLines: const [
    BarStat('Diesel generators', 0.64),
    BarStat('Co-generators', 0.90),
    BarStat('Renewables', 0.76),
  ],
  powerLineReports: const [
    StatusLine('Diesel generators: Status [OK]', StatusLevel.ok),
    StatusLine('Co-generators: Status [OK]', StatusLevel.ok),
    StatusLine(
      'Renewables: Status [!!] - Depleting faster than usual - Forensics On-site Team',
      StatusLevel.alert,
    ),
  ],
  supply: const [
    BarStat('Rations', 0.72),
    BarStat('Hygiene & Waste', 0.82),
    BarStat('PPE & Pharma', 0.46),
  ],
  supplyReports: const [
    StatusLine('Rations : Status [OK] - Last voyage - 63d', StatusLevel.ok),
    StatusLine('Hygiene: Status [OK] - Last audit - 42d', StatusLevel.ok),
    StatusLine(
      'Medics: Status [!!] - 65% more PPEs used.\nCAUSE: Drilling and biological operations.',
      StatusLevel.alert,
    ),
  ],
  restock: const [
    BarStat('Vehicle', 0.85),
    BarStat('Research Equipment', 0.70),
    BarStat('Drills & Samples', 0.50),
  ],
  restockPrediction: const PredictionBlock(
    headlines: [
      StatusLine('Heavily running out of Drills & Samples.', StatusLevel.alert),
    ],
    projections: [
      'Drills set to last micro-operations [54+]',
      'Containers [1500+] towards the end of the year. CRITICAL.',
    ],
  ),
  voyageLines: const [
    'Leg II (Bharati to Maitri): Covering the roughly 3,000 km distance between the two stations along the coast in 5 to 7 days, depending on weather and sea-ice.',
  ],
  voyageStatus: 'CURRENT STATUS: OPEN',
  voyageWindow: 'Next best window: 31 Oct - 4 Nov',
  fuelBurnPrediction: const PredictionBlock(
    headlines: [
      StatusLine('Depleting renewables, 0.65x greater than usual.', StatusLevel.alert),
    ],
    projections: [
      'Renewables are set to last 18d less.',
      'Less usage causes vacuum in pipes, connection maintenance. CRITICAL.',
    ],
  ),
  fuelAlert: const AlertReading('WATCH · Renewables', StatusLevel.warn),
  satelliteAlert: const AlertReading('STABLE · -81 dBm', StatusLevel.ok),
  distressAlert: const AlertReading('NONE', StatusLevel.ok),
  weatherReadout:
  '-18°C   ·   Wind 55 km/h   ·   Lake Temp 0.8°C   ·   Humidity 61%   ·   Sat Link -81 dBm',
);

// Base interface Communications panel — not station-specific, represents
// the on-site node's own link/sync health.
const AlertReading baseOutboundLink = AlertReading('OUTBOUND · STABLE', StatusLevel.ok);
const AlertReading baseInboundLink = AlertReading('INBOUND · STABLE', StatusLevel.ok);
const AlertReading baseSatelliteLink = AlertReading('DEGRADED · -94 dBm', StatusLevel.warn);
const AlertReading baseSyncStatus = AlertReading('QUEUED · 14 entries', StatusLevel.warn);
const AlertReading baseDistress = AlertReading('NONE', StatusLevel.ok);
const AlertReading baseSystemStatus = AlertReading('NOMINAL · Uptime 41d', StatusLevel.ok);