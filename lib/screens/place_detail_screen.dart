import 'package:flutter/material.dart';
import 'package:usando_recursos_nativos/models/place.dart';
import 'package:usando_recursos_nativos/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            place.location?.adress ?? '',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    isReadOnly: true,
                    initalLocation: place.location,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.map),
            label: const Text("Ver no mapa"),
          )
        ],
      ),
    );
  }
}
