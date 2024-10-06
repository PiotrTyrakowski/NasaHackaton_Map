import 'package:flutter/material.dart';
import 'package:frontend/Models/polygon.dart';

class MapZoneWidget extends StatelessWidget {
  final MapZone mapZone;

  const MapZoneWidget({super.key, required this.mapZone});

  @override
  Widget build(BuildContext context) {
    return Text(mapZone.polygonPin.title);
  }
}
