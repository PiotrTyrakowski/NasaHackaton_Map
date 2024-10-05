import 'package:frontend/Models/pin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final LatLng center;
  final List<Polygon> polygons;
  final List<Pin> pins;

  MapState({required this.center, required this.polygons, required this.pins});

}
