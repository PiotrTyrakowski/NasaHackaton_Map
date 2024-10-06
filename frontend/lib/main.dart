import 'package:flutter/material.dart';
import 'package:frontend/widgets/map.dart';
import 'package:frontend/widgets/thermometer_slider.dart';

void main() {
  runApp(const EnvironmentMap());
}

class EnvironmentMap extends StatelessWidget {
  const EnvironmentMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnvironmentMap',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<MapScreenState> _key = GlobalKey();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentYear = 2024;

  void _onYearChanged(double year) {
    setState(() {
      _currentYear = year;
      // You can call a method on MapScreen to update the map according to the year
      // For example:
      widget._key.currentState?.updateMapForYear(year);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: MapScreen(key: widget._key),
          ),
          Positioned(
            left: 0,
            top: 56,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              color: Colors.transparent, // Ensures touch events are captured
              child: ThermometerSlider(
                currentYear: _currentYear,
                onYearChanged: _onYearChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
