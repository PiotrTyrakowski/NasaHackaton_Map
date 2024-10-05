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

  int mapStateIndex = 0;

  bool _isInBounds(LatLngBounds bounds, LatLng position) {
    return position.latitude >= bounds.southwest.latitude &&
        position.latitude <= bounds.northeast.latitude &&
        position.longitude >= bounds.southwest.longitude &&
        position.longitude <= bounds.northeast.longitude;
  }

  void _incrementMapIndex(){
    mapStateIndex = (mapStateIndex + 1) % mockData.length;
  }

  void _moveCameraToNewPosition(double newLat, double newLon) {
    setState(() {
      lat = newLat;
      lon = newLon;
      if (_controller != null) {
        _controller!
            .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lon), 14));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Environment map"),
          actions: [
            TextButton(
                onPressed: () {
                  _incrementMapIndex();
                  _moveCameraToNewPosition(mockData[mapStateIndex].center.latitude, mockData[mapStateIndex].center.longitude);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
                ),
                child: const Text(
                  'Tour',
                  style: TextStyle(
                      color: Colors.white), // Ensure the text is visible
                )),
          ],
        ),
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lon),
            zoom: 14,
          ),
          mapType: MapType.satellite,
          markers: Set<Marker>.from(mockData[mapStateIndex].markers),
          polygons: Set<Polygon>.from(mockData[mapStateIndex].polygons),
        ));
  }
}