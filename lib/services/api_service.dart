import 'dart:convert';

import 'package:tawila_task/models/restaurant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://tawila-staging-7bfcdc1fe77c.herokuapp.com';
  static const String restaurantsEndpoint = '/api/v1/restaurants/';

  Future<List<Restaurant>> getRestaurants() async {
    final response = await http.get(Uri.parse(baseUrl + restaurantsEndpoint));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      return json.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
    } else {
      throw Exception('Failed to load restaurant');
    }
  }
}
