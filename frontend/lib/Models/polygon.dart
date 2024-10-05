import 'dart:ui';

import 'package:frontend/Models/pin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polygon {
  final List<LatLng> points;
  final Pin polygonPin;
  final Color polygonColor;

  Polygon(
      {required this.points,
      required this.polygonPin,
      required this.polygonColor});
}
