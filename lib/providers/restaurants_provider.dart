import 'package:flutter/material.dart';
import 'package:tawila_task/models/restaurant.dart';
import 'package:tawila_task/repositories/restaurants_repo.dart';

class RestaurantsProvider extends ChangeNotifier {
  final RestaurantsRepository restaurantRepository;

  RestaurantsProvider({required this.restaurantRepository});

  List<Restaurant> _restuarants = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Restaurant> get restaurants => _restuarants;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getRestaurants() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _restuarants = await restaurantRepository.getRestaurants();
    } catch (e) {
      _errorMessage =
          'Loading Failed, Check your internet connectivity and tap on the icon';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
