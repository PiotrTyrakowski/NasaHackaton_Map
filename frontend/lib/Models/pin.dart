import 'package:google_maps_flutter/google_maps_flutter.dart';

class Pin {
  final String title;
  final String description;
  final LatLng location;
  final String imageUrl;

  Pin(
      {required this.title,
      required this.description,
      required this.location,
      required this.imageUrl});
}