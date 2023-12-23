import 'package:flutter/material.dart';
import 'package:flutter_google_maps/home_screen.dart';
import 'package:flutter_google_maps/location_screen.dart';

void main() {
  runApp(const GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
