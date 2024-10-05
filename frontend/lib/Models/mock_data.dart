import 'package:flutter/material.dart';
import 'package:frontend/Models/map_state.dart';
import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<MapState> mockData = [
  MapState(
    center: const LatLng(37.7749, -122.4194),
    zones: [
      MapZone(
        points: [
          const LatLng(37.523, -122.4194),
          const LatLng(37.913, -122.4194),
          const LatLng(37.7749, -124.4194),
        ],
        polygonPin: const Pin(
          title: 'San Francisco',
          description: 'San Francisco, CA, USA',
          location: LatLng(37.7749, -122.4194),
          imageUrl: 'https://www.visitcalifornia.com/sites/default/files/styles/welcome_image/public/VCW_SanFrancisco_1.jpg',
        ),
        polygonColor: Colors.blue.withOpacity(0.5),
      ),
    ],
    pins: [
      const Pin(
        title: 'San Francisco',
        description: 'San Francisco, CA, USA',
        location: LatLng(37.7749, -122.4194),
        imageUrl: 'https://www.visitcalifornia.com/sites/default/files/styles/welcome_image/public/VCW_SanFrancisco_1.jpg',
      ),
    ],
  ),
];