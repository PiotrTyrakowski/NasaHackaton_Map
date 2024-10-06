import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Models/map_state.dart';
import '../Models/mock_data.dart';
import '../Models/place.dart';


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
    print("Map updated for year: $year");
    _incrementPlaceStoriesIndex();
    _updatePolygonPoints(); // Update the polygon points based on the year
  }

  void _updatePolygonPoints() {
    setState(() {
      // Increment the points index and wrap around if necessary
      zoneIndex = (zoneIndex + 1) % placeStories[placeIndex].zones.length;
      // mapStates[mapStateIndex].zones.length;
    });
  }

  double lat = placeStories[0].tour.lat;
  double lon = placeStories[0].tour.lon;


  int placeIndex = 0;
  int zoneIndex = 0; // New index to track the current points list

  bool _isInBounds(LatLngBounds bounds, LatLng position) {
    return position.latitude >= bounds.southwest.latitude &&
        position.latitude <= bounds.northeast.latitude &&
        position.longitude >= bounds.southwest.longitude &&
        position.longitude <= bounds.northeast.longitude;
  }

  void _incrementPlaceStoriesIndex() {
    setState(() {
      placeIndex = (placeIndex + 1) % placeStories.length;
      print('Current placeIndex: $placeIndex'); // Print the value of placeIndex each time it changes
    });
  }

  void _updatePlaceAndCords(){
    //_incrementPlaceStoriesIndex();
    lon = placeStories[placeIndex].tour.lon;
    lat = placeStories[placeIndex].tour.lat;
    _currentPosition = LatLng(lat, lon); // Initialize with default or first position
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

  void _updateData() {
    setState(() {
      // Update your data here
      _incrementPlaceStoriesIndex();
      _updatePlaceAndCords();
      //_incrementTourAndCords();
      _updateCameraPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Environment map"),
        actions: [
          TextButton(
              onPressed: _updateData,
              
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
      body: Row(
        children: [
          const Spacer(), // Pushes the map to the right
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95, // Set width to 95% of screen width
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                print('Current placeIndex: $placeIndex'); // Print the value of placeIndex
              },
              onCameraMove: _onMapMoved, // Add this line to track map movement
              initialCameraPosition: CameraPosition(
                target: _currentPosition, // Use the stored position
                zoom: 14,
              ),
              mapType: MapType.satellite,
              markers: {}, // Assuming you don't need markers from FutureBuilder
              polygons: {
                Polygon(
                  polygonId: PolygonId(placeStories[placeIndex].zones[zoneIndex].polygonPin.title),
                  points: placeStories[placeIndex].zones[zoneIndex].points,
                  fillColor: placeStories[placeIndex].zones[zoneIndex].polygonColor,
                  strokeWidth: 1,
                  onTap: () {}, // Define behavior on tap if needed
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
