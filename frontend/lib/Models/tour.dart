import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tour {
  final double lat;
  final double lon;
  final String description;

  Tour({required this.lat, required this.lon, this.description = ""});
}