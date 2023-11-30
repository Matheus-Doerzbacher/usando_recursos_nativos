import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:usando_recursos_nativos/utils/key_google.dart';

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    // Foi criado um novo arquivo na mesma pasta com o nome key_google.dart contendo o valor da Key usada a linha abaixo.
    // Obs: Esse arquivo foi inserido no .gitignore
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${KeyGoogle.GOOGLE_APY_KEY}';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${KeyGoogle.GOOGLE_APY_KEY}';
    final response = await get(Uri.parse(url));
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
