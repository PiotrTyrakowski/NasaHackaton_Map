import 'package:flutter/material.dart';
import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:frontend/Models/tour.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapObjects{
  final Set<Marker> markers;
  final Set<Polygon> polygons;

  const mapObjects({
    required this.markers,
    required this.polygons,
  });
}

class MapState {
  final List<MapZone> zones;
  final List<Pin> pins;
  final List<Tour> tours;

  const MapState({
    required this.zones,
    required this.pins,
    required this.tours,
  });

  Future<mapObjects> getMapObjects(BuildContext context) async {
    final Set<Marker> allMarkers = {};
    final Set<Polygon> allPolygons = {};

    for (final pin in pins) {
      final marker = await pin.getMarker(context);
      allMarkers.add(marker);
    }
    for (final zone in zones) {
      final zoneMarker = await zone.getMarker(context);
      allMarkers.add(zoneMarker);
      final polygon = await zone.getPolygon(context);
      allPolygons.add(polygon);
    }

    return mapObjects(markers: allMarkers, polygons: allPolygons);
  }
}
