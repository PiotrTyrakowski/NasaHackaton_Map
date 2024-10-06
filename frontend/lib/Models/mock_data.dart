import 'package:flutter/material.dart';
import 'package:frontend/Models/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:frontend/Models/tour.dart';

// Initialize Pins
const Pin pin1 = Pin(
  title: 'Pin 1',
  description: 'Description for pin 1',
  location: LatLng(37.7749, -122.4194), // San Francisco
  assetPath: 'assets/icons/flod_icon.png', // Custom marker asset path if needed
);

const Pin pin2 = Pin(
  title: 'Pin 2',
  description: 'Description for pin 2',
  location: LatLng(34.0522, -118.2437), // Los Angeles
  assetPath: 'assets/icons/flod_icon.png', // Custom marker asset path if needed
);

const Pin pin3 = Pin(
  title: 'Pin 3',
  description: 'Description for pin 3',
  location: LatLng(40.7128, -74.0060), // New York
  assetPath: 'assets/icons/flod_icon.png', // Custom marker asset path if needed
);

// Initialize MapZones for 2024
final MapZone zone1 = MapZone(
  points: [
    const LatLng(37.7749, -122.4194),
    const LatLng(38.7849, -120.4294),
    const LatLng(40.7949, -125.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone zone2 = MapZone(
  points: [
    const LatLng(34.0522, -118.2437),
    const LatLng(36.0622, -117.2537),
    const LatLng(31.0722, -112.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone zone3 = MapZone(
  points: [
    const LatLng(40.7128, -74.0060),
    const LatLng(39.7228, -74.0160),
    const LatLng(40.7328, -75.0260),
  ],
  polygonPin: pin3,
  polygonColor: Colors.green.withOpacity(0.5),
);

// 2024 MapState (Initial state)
final MapState mapState2024 = MapState(
  zones: [zone1, zone2, zone3],
  pins: [pin1, pin2, pin3],
  tours: [
    Tour(lat: 37.7749, lon: -122.4194, description: 'San Francisco'),
    Tour(lat: 34.0522, lon: -118.2437, description: 'Los Angeles'),
    Tour(lat: 40.7128, lon: -74.0060, description: 'New York'),
  ],
);

// 2050 MapState (Expanded zones)
final MapZone expandedZone1_2050 = MapZone(
  points: [
    LatLng(37.7749, -122.4194),
    LatLng(39.7849, -120.4294),
    LatLng(41.7949, -125.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone expandedZone2_2050 = MapZone(
  points: [
    LatLng(34.0522, -118.2437),
    LatLng(37.0622, -117.2537),
    LatLng(32.0722, -112.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone expandedZone3_2050 = MapZone(
  points: [
    LatLng(40.7128, -74.0060),
    LatLng(38.7228, -74.0160),
    LatLng(42.7328, -75.0260),
  ],
  polygonPin: pin3,
  polygonColor: Colors.green.withOpacity(0.5),
);

final MapState mapState2050 = MapState(
  zones: [expandedZone1_2050, expandedZone2_2050, expandedZone3_2050],
  pins: [pin1, pin2, pin3],
  tours: [
    Tour(lat: 37.7749, lon: -122.4194, description: 'San Francisco'),
    Tour(lat: 34.0522, lon: -118.2437, description: 'Los Angeles'),
    Tour(lat: 40.7128, lon: -74.0060, description: 'New York'),
  ],
);

// 2100 MapState (Further expanded zones)
final MapZone expandedZone1_2100 = MapZone(
  points: [
    LatLng(36.7749, -121.4194),
    LatLng(41.7849, -119.4294),
    LatLng(43.7949, -124.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone expandedZone2_2100 = MapZone(
  points: [
    LatLng(33.0522, -117.2437),
    LatLng(39.0622, -116.2537),
    LatLng(35.0722, -111.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone expandedZone3_2100 = MapZone(
  points: [
    LatLng(39.7128, -73.0060),
    LatLng(37.7228, -73.0160),
    LatLng(43.7328, -74.0260),
  ],
  polygonPin: pin3,
  polygonColor: Colors.green.withOpacity(0.5),
);

final MapState mapState2100 = MapState(
  zones: [expandedZone1_2100, expandedZone2_2100, expandedZone3_2100],
  pins: [pin1, pin2, pin3],
  tours: [
    Tour(lat: 37.7749, lon: -122.4194, description: 'San Francisco'),
    Tour(lat: 34.0522, lon: -118.2437, description: 'Los Angeles'),
    Tour(lat: 40.7128, lon: -74.0060, description: 'New York'),
  ],
);

// 2150 MapState (Further expansion)
final MapZone expandedZone1_2150 = MapZone(
  points: [
    LatLng(35.7749, -120.4194),
    LatLng(43.7849, -118.4294),
    LatLng(45.7949, -123.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone expandedZone2_2150 = MapZone(
  points: [
    LatLng(32.0522, -116.2437),
    LatLng(41.0622, -115.2537),
    LatLng(37.0722, -110.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone expandedZone3_2150 = MapZone(
  points: [
    LatLng(38.7128, -72.0060),
    LatLng(36.7228, -72.0160),
    LatLng(44.7328, -73.0260),
  ],
  polygonPin: pin3,
  polygonColor: Colors.green.withOpacity(0.5),
);

final MapState mapState2150 = MapState(
  zones: [expandedZone1_2150, expandedZone2_2150, expandedZone3_2150],
  pins: [pin1, pin2, pin3],
  tours: [
    Tour(lat: 37.7749, lon: -122.4194, description: 'San Francisco'),
    Tour(lat: 34.0522, lon: -118.2437, description: 'Los Angeles'),
    Tour(lat: 40.7128, lon: -74.0060, description: 'New York'),
  ],
);

// 2200 MapState (Maximum expansion)
final MapZone expandedZone1_2200 = MapZone(
  points: [
    LatLng(34.7749, -119.4194),
    LatLng(45.7849, -117.4294),
    LatLng(47.7949, -122.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone expandedZone2_2200 = MapZone(
  points: [
    LatLng(31.0522, -115.2437),
    LatLng(43.0622, -114.2537),
    LatLng(39.0722, -109.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone expandedZone3_2200 = MapZone(
  points: [
    LatLng(37.7128, -71.0060),
    LatLng(35.7228, -71.0160),
    LatLng(45.7328, -72.0260),
  ],
  polygonPin: pin3,
  polygonColor: Colors.green.withOpacity(0.5),
);

final MapState mapState2200 = MapState(
  zones: [expandedZone1_2200, expandedZone2_2200, expandedZone3_2200],
  pins: [pin1, pin2, pin3],
  tours: [
    Tour(lat: 37.7749, lon: -122.4194, description: 'San Francisco'),
    Tour(lat: 34.0522, lon: -118.2437, description: 'Los Angeles'),
    Tour(lat: 40.7128, lon: -74.0060, description: 'New York'),
  ],
);

// Final List of MapStates
final List<MapState> mapStates = [
  mapState2024,
  mapState2050,
  mapState2100,
  mapState2150,
  mapState2200,
];
