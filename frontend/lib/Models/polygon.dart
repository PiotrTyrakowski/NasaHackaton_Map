import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/Models/pin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapZone {
  final List<LatLng> points;
  final Pin polygonPin;
  final Color polygonColor;

  MapZone({required this.points,
    required this.polygonPin,
    required this.polygonColor});

  Marker get marker => polygonPin.marker;

  Polygon get polygon =>
      Polygon(
          polygonId: PolygonId(polygonPin.location.toString()),
          fillColor: polygonColor,
          strokeColor: Colors.black,
          strokeWidth: 2
      );
}