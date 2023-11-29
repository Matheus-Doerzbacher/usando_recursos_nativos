import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usando_recursos_nativos/providers/grate_places.dart';
import 'package:usando_recursos_nativos/utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Lugares"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GratePlaces>(
        child: const Center(
          child: Text("Nenhuma localização cadastrada"),
        ),
        builder: (ctx, gratePlace, child) => gratePlace.itemsCount == 0
            ? child!
            : ListView.builder(
                itemCount: gratePlace.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      gratePlace.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(
                    gratePlace.items[i].title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
