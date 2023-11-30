import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:usando_recursos_nativos/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initalLocation;

  const MapScreen({
    super.key,
    this.initalLocation = const PlaceLocation(
      latitude: 37.419857,
      longitude: -122.078827,
    ),
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecione..."),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initalLocation.latitude,
            widget.initalLocation.longitude,
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
