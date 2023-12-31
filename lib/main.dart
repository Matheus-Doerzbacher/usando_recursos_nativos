import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usando_recursos_nativos/providers/great_places.dart';
import 'package:usando_recursos_nativos/screens/place_detail_screen.dart';
import 'package:usando_recursos_nativos/screens/place_form_screen.dart';
import 'package:usando_recursos_nativos/screens/places_list_screen.dart';
import 'package:usando_recursos_nativos/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recursos Nativos',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            secondary: Colors.amber,
          ),
          useMaterial3: true,
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (_) => const PlaceFormScreen(),
          AppRoutes.PLACE_DETAIL: (_) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
