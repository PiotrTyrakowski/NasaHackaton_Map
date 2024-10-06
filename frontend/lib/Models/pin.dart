import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/map_zone_widget.dart';

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

  Future<Marker> getMarker(BuildContext context) async {
    BitmapDescriptor icon = BitmapDescriptor.defaultMarker;

    if (assetPath.isNotEmpty) {
      await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        assetPath,
      ).then((BitmapDescriptor bitmap) {
        icon = bitmap;
      });
    }

    return Marker(
      markerId: MarkerId(location.toString()),
      position: location,
      icon: icon,
      onTap: () => _showPinDetails(context),
    );
  }

  Function() get onTap => () => _showPinDetails;

  void _showPinDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PinWidget(pin: this);
      },
    );
  }
}