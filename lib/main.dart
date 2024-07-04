import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawila_task/providers/restaurants_provider.dart';
import 'package:tawila_task/repositories/restaurants_repo.dart';
import 'package:tawila_task/services/api_service.dart';
import 'package:tawila_task/view/restaurants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => RestaurantsProvider(
                  restaurantRepository:
                      RestaurantsRepository(apiService: ApiService())))
        ],
        child: MaterialApp(
            title: 'Tawila Restaurants',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const RestaurantsScreen()));
  }
}
