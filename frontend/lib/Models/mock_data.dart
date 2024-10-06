import 'package:flutter/material.dart';
import 'package:frontend/Models/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/Models/pin.dart';
import 'package:frontend/Models/polygon.dart';
import 'package:frontend/Models/tour.dart';

final MapState realMapState2050 = MapState(
  zones: [
    MapZone(
      points: [
        LatLng(29.4514, -94.6322),
        LatLng(29.5994, -94.6544),
        LatLng(29.6728, -94.3975),
        LatLng(29.4558, -94.5920),
        LatLng(29.6286, -94.3544),
        LatLng(29.6631, -94.2481),
        LatLng(29.7319, -94.2994),
        LatLng(29.7700, -94.1283),
        LatLng(29.8636, -94.1439),
        LatLng(29.8981, -94.0714),
        LatLng(29.6792, -93.8342),
        LatLng(29.6614, -94.0881),
      ],
      polygonPin: const Pin(
        title: 'Flooded Region: Loss of Homes & Properties',
        description:
            'Severe flooding in Galveston, Texas, due to sea-level rise. Many'
                ' areas are submerged, with communities experiencing widespread '
                'property damage and loss of livelihoods.',
        location: LatLng(29.7319, -94.2994),
        assetPath: 'assets/icons/flood_icon.png',
      ),
      polygonColor: Colors.blue.withOpacity(0.5),
    ),
  ],
  pins: [],
  tours: [
    Tour(
      lat: 29.7319,
      lon: -94.2994,
      description:
          "This tour highlights areas in Galveston severely impacted by a 0.5-meter "
              "rise in sea levels. Residents in these zones have lost homes, businesses,"
              " and property to encroaching waters. The devastation has displaced entire "
              "communities and significantly altered the region's landscape.",
    ),
  ],
);

final MapState realMapState2024 = MapState(
  zones: [],
  pins: [],
  tours: [],
);

final MapState realMapState2100 = MapState(
  zones: [],
  pins: [],
  tours: [],
);

final MapState realMapState2150 = MapState(
  zones: [],
  pins: [],
  tours: [],
);

final MapState realMapState2200 = MapState(
  zones: [],
  pins: [],
  tours: [],
);

final List<MapState> mapStates = [
  realMapState2024,
  realMapState2050,
  realMapState2100,
  realMapState2150,
  realMapState2200,
];
