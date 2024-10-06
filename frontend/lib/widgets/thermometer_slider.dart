import 'package:flutter/material.dart';

class ThermometerSlider extends StatefulWidget {
  @override
  _ThermometerSliderState createState() => _ThermometerSliderState();
}

class _ThermometerSliderState extends State<ThermometerSlider> {
  double _currentYear = 2024;
  double _minYear = 2024;
  double _maxYear = 2100;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _getGradientForYear(_currentYear),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 100,
            bottom: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _maxYear.toStringAsFixed(0),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Expanded(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 30,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 30),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 40),
                        activeTrackColor: Colors.transparent, // Custom track color
                        inactiveTrackColor: Colors.transparent, // Custom track color
                        overlayColor: Colors.red.withAlpha(32),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: _getGradientForYear(_currentYear),
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Slider(
                            value: _currentYear,
                            min: _minYear,
                            max: _maxYear,
                            divisions: (_maxYear - _minYear).toInt(),
                            onChanged: (double value) {
                              setState(() {
                                _currentYear = value;
                              });
                            },
                            label: _currentYear.toStringAsFixed(0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  _minYear.toStringAsFixed(0),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Gradients for different year ranges
  List<Color> _getGradientForYear(double year) {
    if (year < 2040) return [Colors.blue[900]!, Colors.blue];
    if (year < 2060) return [Colors.blue, Colors.green];
    if (year < 2080) return [Colors.green, Colors.yellow];
    if (year < 2100) return [Colors.yellow, Colors.red];
    return [Colors.red, Colors.redAccent];
  }
}