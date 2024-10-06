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

// Initialize MapZones
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

final MapZone zone4 = MapZone(
  points: [
    const LatLng(38.7749, -123.4194),
    const LatLng(39.7849, -121.4294),
    const LatLng(41.7949, -126.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone zone5 = MapZone(
  points: [
    const LatLng(35.0522, -119.2437),
    const LatLng(37.0622, -118.2537),
    const LatLng(32.0722, -113.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone zone6 = MapZone(
  points: [
    const LatLng(41.7128, -74.0060),
    const LatLng(39.7228, -75.0160),
    const LatLng(40.7328, -75.0260),
  ],
  polygonPin: pin3,
  polygonColor: Colors.green.withOpacity(0.5),
);

// Initialize Tours
final Tour tour1 = Tour(lat: 37.7749, lon: -122.4194); // San Francisco tour
final Tour tour2 = Tour(lat: 34.0522, lon: -118.2437); // Los Angeles tour
final Tour tour3 = Tour(lat: 40.7128, lon: -74.0060);  // New York tour

// Create a list of MapState instances
final List<MapState> mapStates = [
  MapState(
    zones: [zone1, zone2, zone3],   // All MapZones combined
    pins: [pin1, pin2, pin3],       // All Pins combined
    tours: [tour1, tour2, tour3],   // All Tours combined
  ),

  MapState(
    zones: [zone4, zone5, zone6],   // All MapZones combined
    pins: [pin1, pin2, pin3],       // All Pins combined
    tours: [tour1, tour2, tour3],   // All Tours combined
  ),
];
