import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tawila_task/providers/restaurants_provider.dart';
import 'package:tawila_task/repositories/restaurants_repo.dart';
import 'package:tawila_task/services/api_service.dart';
import 'package:tawila_task/view/splash_screen.dart';

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
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return const MaterialApp(
                  title: 'Tawila Restaurants', home: SplashScreen());
            }));
  }
}
