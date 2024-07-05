import 'package:flutter/material.dart';
import 'package:tawila_task/models/restaurant.dart';
import 'package:tawila_task/repositories/restaurants_repo.dart';

class RestaurantsProvider extends ChangeNotifier {
  final RestaurantsRepository restaurantRepository;

  RestaurantsProvider({required this.restaurantRepository});

  List<Restaurant> _restaurants = [];
  List<Restaurant> _filteredRestaurants = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Restaurant> get restaurants => _restaurants;
  List<Restaurant> get filteredRestaurants => _filteredRestaurants;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getRestaurants() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _restaurants = await restaurantRepository.getRestaurants();
      _filteredRestaurants = _restaurants;
    } catch (e) {
      _errorMessage =
          'Loading Failed, Check your internet connectivity and tap on the icon';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateRestaurants(List<Restaurant> restaurants) {
    _restaurants = restaurants;
    _filteredRestaurants = restaurants;
    notifyListeners();
  }

  void updateFilteredRestaurants(List<Restaurant> filteredRestaurants) {
    _filteredRestaurants = filteredRestaurants;
    notifyListeners();
  }
}
