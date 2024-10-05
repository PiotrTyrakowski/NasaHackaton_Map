import 'package:flutter/material.dart';
import 'package:frontend/Models/map_state.dart';
import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<MapState> mockData = [
  MapState(
    center: const LatLng(37.7749, -122.4194), // San Francisco
    zones: [
      MapZone(
        points: [
          const LatLng(36.523, -122.4194),
          const LatLng(38.913, -122.4194),
          const LatLng(37.7749, -124.4194),
        ],
        polygonPin: const Pin(
          title: 'San Francisco',
          description: 'San Francisco, CA, USA',
          location: LatLng(37.7749, -122.4194),
          imageUrl: '',
        ),
        polygonColor: Colors.red.withOpacity(0.5),
      ),
    ],
    pins: [],
  ),

  // New York City
  MapState(
    center: const LatLng(40.7128, -74.0060),
    zones: [
      MapZone(
        points: [
          const LatLng(40.6028, -74.0060),
          const LatLng(40.9128, -74.0060),
          const LatLng(40.7128, -73.8060),
        ],
        polygonPin: const Pin(
          title: 'New York City',
          description: 'New York, NY, USA',
          location: LatLng(40.7128, -74.0060),
          imageUrl: '',
        ),
        polygonColor: Colors.blue.withOpacity(0.5),
      ),
    ],
    pins: [
      const Pin(
        title: 'Statue of Liberty',
        description: 'Iconic landmark in New York City.',
        location: LatLng(40.6892, -74.0445),
        imageUrl: '',
      ),
      const Pin(
        title: 'Central Park',
        description: 'Large public park in New York City.',
        location: LatLng(40.7851, -73.9683),
        imageUrl: '',
      ),
    ],
  ),

  // Los Angeles
  MapState(
    center: const LatLng(34.0522, -118.2437),
    zones: [
      MapZone(
        points: [
          const LatLng(34.1522, -118.2437),
          const LatLng(34.2522, -118.3437),
          const LatLng(34.0522, -118.1437),
        ],
        polygonPin: const Pin(
          title: 'Los Angeles',
          description: 'Los Angeles, CA, USA',
          location: LatLng(34.0522, -118.2437),
          imageUrl: '',
        ),
        polygonColor: Colors.green.withOpacity(0.5),
      ),
    ],
    pins: [
      const Pin(
        title: 'Hollywood Sign',
        description: 'Famous landmark in the Hollywood Hills.',
        location: LatLng(34.1341, -118.3215),
        imageUrl: '',
      ),
      const Pin(
        title: 'Santa Monica Pier',
        description: 'Popular tourist destination.',
        location: LatLng(34.0100, -118.4962),
        imageUrl: '',
      ),
    ],
  ),

  // Chicago
  MapState(
    center: const LatLng(41.8781, -87.6298),
    zones: [
      MapZone(
        points: [
          const LatLng(41.7781, -87.6298),
          const LatLng(41.9781, -87.5298),
          const LatLng(41.8781, -87.4298),
        ],
        polygonPin: const Pin(
          title: 'Chicago',
          description: 'Chicago, IL, USA',
          location: LatLng(41.8781, -87.6298),
          imageUrl: '',
        ),
        polygonColor: Colors.yellow.withOpacity(0.5),
      ),
    ],
    pins: [
      const Pin(
        title: 'Millennium Park',
        description: 'Home of Cloud Gate (The Bean).',
        location: LatLng(41.8827, -87.6233),
        imageUrl: '',
      ),
      const Pin(
        title: 'Willis Tower',
        description: 'Formerly known as the Sears Tower.',
        location: LatLng(41.8789, -87.6359),
        imageUrl: '',
      ),
    ],
  ),
];
