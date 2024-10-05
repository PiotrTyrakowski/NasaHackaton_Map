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

  Marker get marker => Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: InfoWindow(
          title: title,
          snippet: description,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
}