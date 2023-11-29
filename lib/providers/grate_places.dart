import 'package:flutter/material.dart';
import 'package:usando_recursos_nativos/models/place.dart';

class GratePlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemsCount => _items.length;

  Place itemByIndex(int index) => _items[index];
}
