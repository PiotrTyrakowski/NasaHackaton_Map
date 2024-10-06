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
        LatLng(29.5989, -94.3844),
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
            '''Severe flooding in Galveston, Texas, due to sea-level rise. Many
            areas are submerged, with communities experiencing widespread 
            property damage and loss of livelihoods. Helpful materials:\n
              1. https://science.nasa.gov/climate-change/\n
              2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n
              3. https://news.un.org/en/story/2024/09/1154881''',
        location: LatLng(29.7319, -94.2994),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.blue.withOpacity(0.5),
    ),
    MapZone(
      points: [
        LatLng(23.945, 90.406), // Northernmost Point (near Gazipur)
        LatLng(23.793, 90.615), // Easternmost Point (near Araihazar)
        LatLng(23.670, 90.504), // Southeastern Point (near Narayanganj)
        LatLng(23.751, 90.258), // Southwestern Point (near Hemayetpur)
        LatLng(23.856, 90.225), // Westernmost Point (near Savar)
        LatLng(23.870, 90.334), // Northwestern Point (near Ashulia)
      ],
      polygonPin: const Pin(
        title: 'Heatwave Havoc: Threat to Lives and Livelihoods',
        description:
            '''Rising global temperatures are leading to extreme heatwaves in cities like Dhaka, 
            threatening the health of millions. Increased heat exacerbates water scarcity and disrupts
             agriculture, putting livelihoods at risk. Immediate action is needed to combat
              the impacts of climate change and protect vulnerable communities. Helpful materials:\n
              1. https://science.nasa.gov/climate-change/\n
              2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n
              3. https://news.un.org/en/story/2024/09/1154881''',
        location: LatLng(23.8142, 90.3903),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.red.withOpacity(0.5),
    ),
  ],
  pins: [],
  tours: [
    Tour(
      lat: 29.7319,
      lon: -94.2994,
      description:
          "This tour highlights areas in Galveston severely impacted by a 0.5-meter "
          "rise in sea levels.\n Residents in these zones have lost homes, businesses,"
          " and property to encroaching waters.\n The devastation has displaced entire "
          "communities and significantly altered the region's landscape.\n",
    ),
    Tour(
      lat: 23.8142,
      lon: 90.3903,
      description:
          '''Residents in these areas are experiencing worsening heatwaves, leading to health crises and compromised livelihoods.
The escalating temperatures are pushing communities towards uninhabitability, with outdoor activities becoming dangerous.
Urgent action is required to mitigate the impacts of climate change and protect vulnerable populations.''',
    ),
  ],
);

final MapState realMapState2024 = MapState(
  zones: [],
  pins: [],
  tours: [],
);

final MapState realMapState2100 = MapState(
  zones: [
    MapZone(
      points: [
        LatLng(29.4514, -94.6322),
        LatLng(29.6783, -94.6708),
        LatLng(29.7294, -94.3994),
        LatLng(29.6917, -94.3425),
        LatLng(29.7033, -94.3122),
        LatLng(29.7517, -94.3153),
        LatLng(29.8014, -94.1864),
        LatLng(29.8911, -94.2131),
        LatLng(29.9553, -94.1481),
        LatLng(29.8953, -94.0675),
        LatLng(29.6792, -93.8342),
        LatLng(29.6614, -94.0881)
      ],
      polygonPin: const Pin(
        title: 'Flooded Region: Loss of Homes & Properties',
        description:
            'Severe flooding in Galveston, Texas, due to sea-level rise. Many'
            ' areas are submerged, with communities experiencing widespread '
            'property damage and loss of livelihoods.',
        location: LatLng(29.7319, -94.2994),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.blue.withOpacity(0.5),
    ),
    MapZone(
      points: [
        LatLng(23.945, 90.406), // Northernmost Point (near Gazipur)
        LatLng(23.793, 90.615), // Easternmost Point (near Araihazar)
        LatLng(23.670, 90.504), // Southeastern Point (near Narayanganj)
        LatLng(23.751, 90.258), // Southwestern Point (near Hemayetpur)
        LatLng(23.856, 90.225), // Westernmost Point (near Savar)
        LatLng(23.870, 90.334), // Northwestern Point (near Ashulia)
      ],
      polygonPin: const Pin(
        title: 'Heatwave Havoc: Threat to Lives and Livelihoods',
        description:
            '''Rising global temperatures are leading to extreme heatwaves in cities like Dhaka, 
            threatening the health of millions. Increased heat exacerbates water scarcity and disrupts
             agriculture, putting livelihoods at risk. Immediate action is needed to combat
              the impacts of climate change and protect vulnerable communities. Helpful materials:\n
              1. https://science.nasa.gov/climate-change/\n
              2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n
              3. https://news.un.org/en/story/2024/09/1154881''',
        location: LatLng(23.8142, 90.3903),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.red.withOpacity(0.5),
    ),

  ],
  pins: [
    Pin(
      title: 'Miami Beach, Florida',
      description:
          'Miami Beach, Florida, is at risk of being submerged by rising sea levels. '
          'The city is experiencing frequent flooding, causing damage to '
          'infrastructure and threatening the local economy.',
      location: LatLng(25.7907, -80.1300),
      assetPath: 'assets/icons/miami_icon.png',
    ),
  ],
  tours: [
    Tour(
      lat: 29.7319,
      lon: -94.2994,
      description:
          "This tour highlights areas in Galveston severely impacted by a 1.2-meter "
          "rise in sea levels.\n Residents in these zones have lost homes, businesses,"
          " and property to encroaching waters.\n The devastation has displaced entire "
          "communities and significantly altered the region's landscape.\n"
          "Helpful materials:\n"
          "1. https://science.nasa.gov/climate-change/\n"
          "2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n"
          "3. https://news.un.org/en/story/2024/09/1154881",
    ),
    Tour(
      lat: 25.7907,
      lon: -80.1300,
      description:
          "Miami Beach, Florida, is at risk of being submerged by rising sea levels. "
          "The city is experiencing frequent flooding, causing damage to "
          "infrastructure and threatening the local economy.",
    )
  ],
);

final MapState realMapState2150 = MapState(
  zones: [
    MapZone(
      points: [
        LatLng(29.4514, -94.6322),
        LatLng(29.7014, -94.6803),
        LatLng(29.7722, -94.2950),
        LatLng(29.8494, -94.3011),
        LatLng(29.9722, -94.1525),
        LatLng(29.9744, -94.0839),
        LatLng(29.6792, -93.8342),
        LatLng(29.6614, -94.0881)
      ],
      polygonPin: const Pin(
        title: 'Flooded Region: Loss of Homes & Properties',
        description:
            'Severe flooding in Galveston, Texas, due to sea-level rise. Many'
            ' areas are submerged, with communities experiencing widespread '
            'property damage and loss of livelihoods.',
        location: LatLng(29.7319, -94.2994),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.blue.withOpacity(0.5),
    ),
    MapZone(
      points: [
        LatLng(23.945, 90.406), // Northernmost Point (near Gazipur)
        LatLng(23.793, 90.615), // Easternmost Point (near Araihazar)
        LatLng(23.670, 90.504), // Southeastern Point (near Narayanganj)
        LatLng(23.751, 90.258), // Southwestern Point (near Hemayetpur)
        LatLng(23.856, 90.225), // Westernmost Point (near Savar)
        LatLng(23.870, 90.334), // Northwestern Point (near Ashulia)
      ],
      polygonPin: const Pin(
        title: 'Heatwave Havoc: Threat to Lives and Livelihoods',
        description:
        '''Rising global temperatures are leading to extreme heatwaves in cities like Dhaka, 
            threatening the health of millions. Increased heat exacerbates water scarcity and disrupts
             agriculture, putting livelihoods at risk. Immediate action is needed to combat
              the impacts of climate change and protect vulnerable communities. Helpful materials:\n
              1. https://science.nasa.gov/climate-change/\n
              2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n
              3. https://news.un.org/en/story/2024/09/1154881''',
        location: LatLng(23.8142, 90.3903),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.red.withOpacity(0.5),
    ),
  ],
  pins: [
    Pin(
      title: 'Venice, Italy',
      description:
          'Venice, Italy, is at risk of being submerged by rising sea levels. '
          'The city is experiencing frequent flooding, causing damage to '
          'historic buildings and threatening the local economy.',
      location: LatLng(45.4408, 12.3155),
      assetPath: 'assets/icons/venice_icon.png',
    ),
    // Miami Beach will be flooded by 2100
    Pin(
      title: 'Miami Beach, Florida',
      description:
          'Miami Beach, Florida, is at risk of being submerged by rising sea levels. '
          'The city is experiencing frequent flooding, causing damage to '
          'infrastructure and threatening the local economy.',
      location: LatLng(25.7907, -80.1300),
      assetPath: 'assets/icons/miami_icon.png',
    ),
  ],
  tours: [
    Tour(
      lat: 29.7319,
      lon: -94.2994,
      description:
          "This tour highlights areas in Galveston severely impacted by a 1.98-meter "
          "rise in sea levels.\n Residents in these zones have lost homes, businesses,"
          " and property to encroaching waters.\n The devastation has displaced entire "
          "communities and significantly altered the region's landscape.\n"
          "Helpful materials:\n"
          "1. https://science.nasa.gov/climate-change/\n"
          "2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n"
          "3. https://news.un.org/en/story/2024/09/1154881",
    ),
    Tour(
      lat: 23.8142,
      lon: 90.3903,
      description:
          '''Residents in these areas are experiencing worsening heatwaves, leading to health crises and compromised livelihoods.
The escalating temperatures are pushing communities towards uninhabitability, with outdoor activities becoming dangerous.
Urgent action is required to mitigate the impacts of climate change and protect vulnerable populations.''',
    ),
    Tour(
      lat: 45.4408,
      lon: 12.3155,
      description:
          "Venice, Italy, is at risk of being submerged by rising sea levels. "
          "The city is experiencing frequent flooding, causing damage to "
          "historic buildings and threatening the local economy.",
    ),
    Tour(
      lat: 25.7907,
      lon: -80.1300,
      description:
          "Miami Beach, Florida, is at risk of being submerged by rising sea levels. "
          "The city is experiencing frequent flooding, causing damage to "
          "infrastructure and threatening the local economy.",
    )
  ],
);

final MapState realMapState2200 = MapState(
  zones: [
    MapZone(
      points: [
        LatLng(29.4514, -94.6322),
        LatLng(29.7014, -94.6803),
        LatLng(29.7722, -94.2950),
        LatLng(29.8494, -94.3011),
        LatLng(29.9722, -94.1525),
        LatLng(29.9744, -94.0839),
        LatLng(29.6792, -93.8342),
        LatLng(29.6614, -94.0881)
      ],
      polygonPin: const Pin(
        title: 'Flooded Region: Loss of Homes & Properties',
        description:
        'Severe flooding in Galveston, Texas, due to sea-level rise. Many'
            ' areas are submerged, with communities experiencing widespread '
            'property damage and loss of livelihoods.',
        location: LatLng(29.7319, -94.2994),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.blue.withOpacity(0.5),
    ),
    MapZone(
      points: [
        LatLng(23.945, 90.406), // Northernmost Point (near Gazipur)
        LatLng(23.793, 90.615), // Easternmost Point (near Araihazar)
        LatLng(23.670, 90.504), // Southeastern Point (near Narayanganj)
        LatLng(23.751, 90.258), // Southwestern Point (near Hemayetpur)
        LatLng(23.856, 90.225), // Westernmost Point (near Savar)
        LatLng(23.870, 90.334), // Northwestern Point (near Ashulia)
      ],
      polygonPin: const Pin(
        title: 'Heatwave Havoc: Threat to Lives and Livelihoods',
        description:
        '''Rising global temperatures are leading to extreme heatwaves in cities like Dhaka, 
            threatening the health of millions. Increased heat exacerbates water scarcity and disrupts
             agriculture, putting livelihoods at risk. Immediate action is needed to combat
              the impacts of climate change and protect vulnerable communities. Helpful materials:\n
              1. https://science.nasa.gov/climate-change/\n
              2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n
              3. https://news.un.org/en/story/2024/09/1154881''',
        location: LatLng(23.8142, 90.3903),
        assetPath: 'assets/icons/flod_icon.png',
      ),
      polygonColor: Colors.red.withOpacity(0.5),
    ),
  ],
  pins: [
    Pin(
      title: 'Venice, Italy',
      description:
      'Venice, Italy, is at risk of being submerged by rising sea levels. '
          'The city is experiencing frequent flooding, causing damage to '
          'historic buildings and threatening the local economy.',
      location: LatLng(45.4408, 12.3155),
      assetPath: 'assets/icons/venice_icon.png',
    ),
    // Miami Beach will be flooded by 2100
    Pin(
      title: 'Miami Beach, Florida',
      description:
      'Miami Beach, Florida, is at risk of being submerged by rising sea levels. '
          'The city is experiencing frequent flooding, causing damage to '
          'infrastructure and threatening the local economy.',
      location: LatLng(25.7907, -80.1300),
      assetPath: 'assets/icons/miami_icon.png',
    ),
  ],
  tours: [
    Tour(
      lat: 29.7319,
      lon: -94.2994,
      description:
      "This tour highlights areas in Galveston severely impacted by a 1.98-meter "
          "rise in sea levels.\n Residents in these zones have lost homes, businesses,"
          " and property to encroaching waters.\n The devastation has displaced entire "
          "communities and significantly altered the region's landscape.\n"
          "Helpful materials:\n"
          "1. https://science.nasa.gov/climate-change/\n"
          "2. https://www.climate.gov/news-features/climate-qa/can-we-slow-or-even-reverse-global-warming\n"
          "3. https://news.un.org/en/story/2024/09/1154881",
    ),
    Tour(
      lat: 23.8142,
      lon: 90.3903,
      description:
      '''Residents in these areas are experiencing worsening heatwaves, leading to health crises and compromised livelihoods.
The escalating temperatures are pushing communities towards uninhabitability, with outdoor activities becoming dangerous.
Urgent action is required to mitigate the impacts of climate change and protect vulnerable populations.''',
    ),
    Tour(
      lat: 45.4408,
      lon: 12.3155,
      description:
      "Venice, Italy, is at risk of being submerged by rising sea levels. "
          "The city is experiencing frequent flooding, causing damage to "
          "historic buildings and threatening the local economy.",
    ),
    Tour(
      lat: 25.7907,
      lon: -80.1300,
      description:
      "Miami Beach, Florida, is at risk of being submerged by rising sea levels. "
          "The city is experiencing frequent flooding, causing damage to "
          "infrastructure and threatening the local economy.",
    )
  ],
);


final List<MapState> mapStates = [
  realMapState2024,
  realMapState2050,
  realMapState2100,
  realMapState2150,
  realMapState2200,
];
