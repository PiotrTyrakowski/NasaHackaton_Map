import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class Pin {
  final String title;
  final String description;
  final LatLng location;
  final String assetPath;

  const Pin({
    required this.title,
    required this.description,
    required this.location,
    required this.assetPath,
  });

  Future<Marker> getMarker() async {
    BitmapDescriptor icon = BitmapDescriptor.defaultMarker;

    if (assetPath.isNotEmpty) {
      await BitmapDescriptor.asset(const ImageConfiguration(size: Size(48, 48)), assetPath)
          .then((BitmapDescriptor bitmap) {
        icon = bitmap;
      });
    }

    return Marker(
      markerId: MarkerId(location.toString()),
      position: location,
      icon: icon,
    );
  }
}
