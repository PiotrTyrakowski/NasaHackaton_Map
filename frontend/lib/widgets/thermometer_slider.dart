import 'package:flutter/material.dart';


class ThermometerSlider extends StatefulWidget {
  final Function(double) onYearChanged;
  final double initialYear;

  ThermometerSlider({required this.onYearChanged, required this.initialYear});

  @override
  _ThermometerSliderState createState() => _ThermometerSliderState();
}

class _ThermometerSliderState extends State<ThermometerSlider> {
  double _currentYear = 2024;
  double _minYear = 2024;
  double _maxYear = 2200;


  @override
  void initState() {
    _currentYear = widget.initialYear;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      activeTrackColor: Colors.red,
                      inactiveTrackColor: Colors.blue,
                      thumbColor: _getColorForYear(_currentYear),
                      overlayColor: Colors.red.withAlpha(32),
                    ),
                    child: Slider(
                      value: _currentYear,
                      min: _minYear,
                      max: _maxYear,
                      divisions: (_maxYear - _minYear).toInt(),
                      onChanged: (double value) {
                        setState(() {
                          _currentYear = value;
                        });
                        widget.onYearChanged(_currentYear);
                      },
                      label: _currentYear.toStringAsFixed(0),
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
    );
  }

  Color _getColorForYear(double year) {
    return Colors.black87;
    if (year < 2040) return Colors.blue;
    if (year < 2060) return Colors.green;
    if (year < 2080) return Colors.yellow;
    if (year < 2100) return Colors.red;
    return Colors.redAccent;
  }
}
