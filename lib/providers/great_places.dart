import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:usando_recursos_nativos/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemsCount => _items.length;

  Place itemByIndex(int index) => _items[index];

  void addPlace({required String title, required File image}) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
