import 'package:tawila_task/models/restaurant.dart';
import 'package:tawila_task/services/api_service.dart';

class RestaurantsRepository {
  final ApiService apiService;

  RestaurantsRepository({required this.apiService});

  Future<List<Restaurant>> getRestaurants() {
    return apiService.getRestaurants();
  }
}
