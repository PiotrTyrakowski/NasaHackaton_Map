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
  late LatLng _currentPosition;

  @override
  void initState() {
    super.initState();
    _currentPosition = LatLng(lat, lon); // Initialize with default or first position
  }

  void updateMapForYear(double year) {
    // Implement your logic to update the map view based on the year
    print("Map updated for year: $year");
  }
  
  double lat = (mapStates.isNotEmpty && mapStates[0].tours.isNotEmpty) ? mapStates[0].tours[0].lat : 50.5822;
  double lon = (mapStates.isNotEmpty && mapStates[0].tours.isNotEmpty) ? mapStates[0].tours[0].lon : 22.0535;

  int mapStateIndex = 0;
  int tourIndex = 0;

  bool _isInBounds(LatLngBounds bounds, LatLng position) {
    return position.latitude >= bounds.southwest.latitude &&
        position.latitude <= bounds.northeast.latitude &&
        position.longitude >= bounds.southwest.longitude &&
        position.longitude <= bounds.northeast.longitude;
  }

  void _incrementMapStateIndex() {
    mapStateIndex = (mapStateIndex + 1) % mapStates.length;
    tourIndex = 0;
  }

  
  void _incrementTourAndCords(){
    if (mapStates[mapStateIndex].tours.isEmpty)
      return;
    tourIndex = (tourIndex + 1) % mapStates[mapStateIndex].tours.length;
    lon = mapStates[mapStateIndex].tours[tourIndex].lon;
    lat = mapStates[mapStateIndex].tours[tourIndex].lat;
  }

  void _updateCameraPosition() {
    setState(() {
      if (_controller != null) {
        _controller!.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition, 14));
      }
    });
  }

  void _onMapMoved(CameraPosition position) {
    _currentPosition = position.target; // Update current position when map is moved
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Environment map"),
        actions: [
          TextButton(
              onPressed: () {
                _incrementTourAndCords();
                _updateCameraPosition();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // Blue background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Adjust padding
              ),
              child: const Text(
                'Tour',
                style: TextStyle(
                    color: Colors.white), // Ensure the text is visible
              )),
        ],
      ),
      body: FutureBuilder<mapObjects>(
        future: Future.value(mapStates[mapStateIndex].getMapObjects(context)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Row(
              children: [
                Spacer(), // Pushes the map to the right
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95, // Set width to 80% of screen width
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                    onCameraMove: _onMapMoved, // Add this line to track map movement
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition, // Use the stored position
                      zoom: 14,
                    ),
                    mapType: MapType.satellite,
                    markers: snapshot.data?.markers ?? {},
                    polygons: snapshot.data?.polygons ?? {},
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
