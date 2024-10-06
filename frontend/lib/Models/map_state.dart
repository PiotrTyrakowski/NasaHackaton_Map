import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:frontend/Models/tour.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final List<MapZone> zones;
  final List<Pin> pins;
  final List<Tour> tours;

  const MapState({
    required this.zones,
    required this.pins,
    required this.tours,
  });

  Future<Set<Marker>> get markers async {
    final Set<Marker> allMarkers = {};

    // Add markers for pins
    for (final pin in pins) {
      allMarkers.add(await pin.getMarker());
    }

    // Add markers for zones
    for (final zone in zones) {
      final zoneMarker = await zone.marker;
      allMarkers.add(zoneMarker);
    }

    return allMarkers;
  }

  List<Polygon> get polygons => zones.map((zone) => zone.polygon).toList();
}