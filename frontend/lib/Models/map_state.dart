import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final LatLng center;
  final List<MapZone> zones;
  final List<Pin> pins;

  const MapState({required this.center, required this.zones, required this.pins});

  List<Marker> get markers =>
      [...zones.map((zone) => zone.marker), ...pins.map((pin) => pin.marker)];

  List<Polygon> get polygons => zones.map((zone) => zone.polygon).toList();
}
