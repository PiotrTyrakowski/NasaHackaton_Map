import 'package:flutter/material.dart';


class ThermometerSlider extends StatefulWidget {
  final Function(double) onYearChanged;
  final double initialYear;

  ThermometerSlider({required this.onYearChanged, required this.initialYear});

  @override
  _ThermometerSliderState createState() => _ThermometerSliderState();
}

class _ThermometerSliderState extends State<ThermometerSlider> {
  late double _currentYear;
  double _minYear = 2024;
  double _maxYear = 2200;

  @override
  void initState() {
    super.initState();
    _currentYear = widget.initialYear;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: 100,  // Set a fixed width for the slider
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
                        activeTrackColor: Colors.transparent,
                        inactiveTrackColor: Colors.transparent,
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
                              widget.onYearChanged(value);
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

  List<Color> _getGradientForYear(double year) {
    if (year < 2040) return [Colors.blue[900]!, Colors.blue];
    if (year < 2060) return [Colors.blue, Colors.green];
    if (year < 2080) return [Colors.green, Colors.yellow];
    if (year < 2100) return [Colors.yellow, Colors.red];
    return [Colors.red, Colors.redAccent];
  }
}