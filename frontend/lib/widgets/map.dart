import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Models/map_state.dart';
import '../Models/mock_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  double lat = 50.049683;
  double lon = 19.944544;

  MapState state = mockData[0];

  bool _isInBounds(LatLngBounds bounds, LatLng position) {
    return position.latitude >= bounds.southwest.latitude &&
        position.latitude <= bounds.northeast.latitude &&
        position.longitude >= bounds.southwest.longitude &&
        position.longitude <= bounds.northeast.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, lon),
              zoom: 14,
            ),
            mapType: MapType.satellite,
            markers: Set<Marker>.from(state.markers),
            polygons: Set<Polygon>.from(state.polygons),
        ));
  }
}
