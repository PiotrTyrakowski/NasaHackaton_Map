import 'package:flutter/material.dart';
import 'package:frontend/Models/pin.dart';

class PinWidget extends StatelessWidget {
  final Pin pin;

  const PinWidget({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // Align the widget to the right
      child: Container(
        width: 300, // Specify a smaller width
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white, // Add a background color for better visibility
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded( // Ensure title doesn't overflow
                  child: Text(
                    pin.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle long titles
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              pin.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
