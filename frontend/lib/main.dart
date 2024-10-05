import 'package:flutter/material.dart';
import 'package:frontend/widgets/map.dart';

void main() {
  runApp(const EnvironmentMap());
}

class EnvironmentMap extends StatelessWidget {
  const EnvironmentMap({super.key});

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
  HomeScreen({super.key});

  final GlobalKey<MapScreenState> _key = GlobalKey();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            MapScreen(key: widget._key),
          ],
        ));
  }
}
