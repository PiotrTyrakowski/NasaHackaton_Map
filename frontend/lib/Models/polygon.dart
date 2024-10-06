import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/Models/pin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/map_zone_wdiget.dart';

class MapZone {
  final List<LatLng> points;
  final Pin polygonPin;
  final Color polygonColor;

  const MapZone(
      {required this.points,
      required this.polygonPin,
      required this.polygonColor});

  Future<Marker> getMarker(BuildContext context) async {
    return polygonPin.getMarker(context);
  }

  Future<Polygon> getPolygon(BuildContext context) async {
    return Polygon(
      polygonId: PolygonId("${polygonPin.location}_polygon"),
      fillColor: polygonColor,
      points: points,
      strokeWidth: 2,
      onTap: () => _showPinDetails(context),
    );
  }

  void _showPinDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PinWidget(pin: polygonPin);
      },
    );
  }
}
