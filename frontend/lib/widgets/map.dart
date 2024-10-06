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
  double zoom = 8;

  int mapStateIndex = 0;
  int tourIndex = 0;
  bool isTourActive = false;
  String currentDescription = '';

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
      isTourActive = false;
      currentDescription = '';
    });
  }

  void _incrementTourAndCords() async {
    setState(() {
      if (mapStates[mapStateIndex].tours.isEmpty) return;
      isTourActive = true;
      tourIndex = (tourIndex + 1) % mapStates[mapStateIndex].tours.length;
      lon = mapStates[mapStateIndex].tours[tourIndex].lon;
      lat = mapStates[mapStateIndex].tours[tourIndex].lat;
      currentDescription =
          mapStates[mapStateIndex].tours[tourIndex].description;
    });
    await _updateCameraPosition();
  }

  void _stopTour() {
    setState(() {
      isTourActive = false;
      currentDescription = '';
      tourIndex = 0;
    });
  }

  Future<void> _updateCameraPosition() async {
    if (_controller != null) {
      await _controller!
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lon), zoom));
    }
  }

  Future<LatLng> getCurrentMapCenter() async {
    if (_controller == null) {
      return LatLng(lat, lon);
    }

    LatLngBounds visibleRegion = await _controller!.getVisibleRegion();
    return LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
  }

  void _onYearChanged(double year) async {
    LatLng currentCenter = await getCurrentMapCenter();
    double zooom = await _controller!.getZoomLevel();

    setState(() {
      lat = currentCenter.latitude;
      lon = currentCenter.longitude;
      zoom = zooom;

      if (year < 2050) {
        mapStateIndex = 0;
      } else if (year >= 2050 && year < 2100) {
        mapStateIndex = 1;
      } else if (year >= 2100 && year < 2150) {
        mapStateIndex = 2;
      } else if (year >= 2150 && year < 2200) {
        mapStateIndex = 3;
      }
      tourIndex = 0;
      isTourActive = false;
      currentDescription = '';
    });

    if (_controller != null) {
      await _controller!.moveCamera(CameraUpdate.newLatLngZoom(currentCenter, zooom));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Environment map"),
        actions: [
          TextButton(
            onPressed: isTourActive ? _incrementTourAndCords : null,
            style: TextButton.styleFrom(
              backgroundColor: isTourActive ? Colors.blue : Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16.0, width: 8,),
          TextButton(
            onPressed: isTourActive ? _stopTour : _incrementTourAndCords,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: Text(
              isTourActive ? 'Stop Tour' : 'Start Tour',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder<mapObjects>(
            future:
                Future.value(mapStates[mapStateIndex].getMapObjects(context)),
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
                    zoom: zoom,
                  ),
                  mapType: MapType.satellite,
                  markers: snapshot.data?.markers ?? {},
                  polygons: snapshot.data?.polygons ?? {},
                );
              }
            },
          ),
          ThermometerSlider(
            onYearChanged: _onYearChanged,
            initialYear: 2024 + mapStateIndex.toDouble() * 50,
          ),
          if (isTourActive)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.black.withOpacity(0.7),
                child: Text(
                  currentDescription,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
