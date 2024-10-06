import 'package:flutter/material.dart';
import 'package:frontend/widgets/thermometer_slider.dart';
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

  double lat = (mapStates.isNotEmpty && mapStates[0].tours.isNotEmpty)
      ? mapStates[0].tours[0].lat
      : 50.5822;
  double lon = (mapStates.isNotEmpty && mapStates[0].tours.isNotEmpty)
      ? mapStates[0].tours[0].lon
      : 22.0535;

  int mapStateIndex = 0;
  int tourIndex = 0;

  bool _isInBounds(LatLngBounds bounds, LatLng position) {
    return position.latitude >= bounds.southwest.latitude &&
        position.latitude <= bounds.northeast.latitude &&
        position.longitude >= bounds.southwest.longitude &&
        position.longitude <= bounds.northeast.longitude;
  }

  void _incrementMapStateIndex() {
    setState(() {
      mapStateIndex = (mapStateIndex + 1) % mapStates.length;
      tourIndex = 0;
    });
  }

  void _incrementTourAndCords() {
    setState(() {
      if (mapStates[mapStateIndex].tours.isEmpty) return;
      tourIndex = (tourIndex + 1) % mapStates[mapStateIndex].tours.length;
      lon = mapStates[mapStateIndex].tours[tourIndex].lon;
      lat = mapStates[mapStateIndex].tours[tourIndex].lat;
    });
    _updateCameraPosition();
  }

  void _updateCameraPosition() {
    if (_controller != null) {
      _controller!
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lon), 14));
    }
  }

  void _onYearChanged(double year) {
    setState(() {
      if (year < 2050){
        mapStateIndex = 0;
      } else if (year >= 2050 && year < 2100){
        mapStateIndex = 1;
      } else if (year >= 2100 && year < 2150){
        mapStateIndex = 2;
      } else if (year >= 2150 && year < 2200){
        mapStateIndex = 3;
      }
      tourIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Environment map"),
        actions: [
          TextButton(
              onPressed: _incrementTourAndCords,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              child: const Text(
                'Tour',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 100, // Set a fixed width for the ThermometerSlider
            child: ThermometerSlider(
              onYearChanged: _onYearChanged,
              initialYear: 2024 + mapStateIndex.toDouble() * 50,
            ),
          ),
          Expanded(
            child: FutureBuilder<mapObjects>(
              future: Future.value(mapStates[mapStateIndex].getMapObjects(context)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, lon),
                      zoom: 14,
                    ),
                    mapType: MapType.satellite,
                    markers: snapshot.data?.markers ?? {},
                    polygons: snapshot.data?.polygons ?? {},
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}