import 'package:flutter/material.dart';
import 'package:frontend/Models/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:frontend/Models/tour.dart';

// Initialize Pins
final Pin pin1 = Pin(
  title: 'Pin 1',
  description: 'Description for pin 1',
  location: LatLng(37.7749, -122.4194), // San Francisco
  assetPath: '', // Custom marker asset path if needed
);

final Pin pin2 = Pin(
  title: 'Pin 2',
  description: 'Description for pin 2',
  location: LatLng(34.0522, -118.2437), // Los Angeles
  assetPath: '',
);

final Pin pin3 = Pin(
  title: 'Pin 3',
  description: 'Description for pin 3',
  location: LatLng(40.7128, -74.0060), // New York
  assetPath: '',
);

// Initialize MapZones
final MapZone zone1 = MapZone(
  points: [
    LatLng(37.7749, -122.4194),
    LatLng(37.7849, -122.4294),
    LatLng(37.7949, -122.4394),
  ],
  polygonPin: pin1,
  polygonColor: Colors.red.withOpacity(0.5),
);

final MapZone zone2 = MapZone(
  points: [
    LatLng(34.0522, -118.2437),
    LatLng(34.0622, -118.2537),
    LatLng(34.0722, -118.2637),
  ],
  polygonPin: pin2,
  polygonColor: Colors.blue.withOpacity(0.5),
);

final MapZone zone3 = MapZone(
  points: [
    LatLng(40.7128, -74.0060),
    LatLng(40.7228, -74.0160),
    LatLng(40.7328, -74.0260),
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
];
