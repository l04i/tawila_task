import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tawila_task/constants.dart';
import 'package:tawila_task/models/restaurant.dart';
import 'package:tawila_task/providers/restaurants_provider.dart';
import 'package:tawila_task/view/reusable_widgets.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  TextEditingController searchController = TextEditingController();
  bool _isError = false;

  Timer? _debounce;

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final restaurantsProvider =
        Provider.of<RestaurantsProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      _getRestaurants(restaurantsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<RestaurantsProvider>(
            builder: (context, restaurantsProvider, child) {
          _isError = restaurantsProvider.errorMessage != null;

          if (restaurantsProvider.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            ));
          } else if (_isError) {
            return ErrorMessageView(
              errorMessage: restaurantsProvider.errorMessage!,
              refresh: () => _getRestaurants(restaurantsProvider),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(10.h),
              child: RefreshIndicator(
                backgroundColor: AppColors.secondary,
                color: AppColors.primary,
                onRefresh: () => _getRestaurants(restaurantsProvider),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          "Taste the World,",
                          style: AppTextStyles.heading,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Right Here at Homes",
                          style: AppTextStyles.heading,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppSearchBar(
                          controller: searchController,
                          onChanged: (keyword) {
                            if (_debounce?.isActive ?? false) {
                              _debounce?.cancel();
                            }
                            _debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              _searchRestaurants(restaurantsProvider, keyword,
                                  restaurantsProvider.restaurants);
                            });
                          }),
                      Text(
                        'Our Restaurants',
                        style: AppTextStyles.heading,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount:
                              restaurantsProvider.filteredRestaurants.length,
                          itemBuilder: (context, index) {
                            return RestaurantCard(
                              restuarant: restaurantsProvider
                                  .filteredRestaurants[index],
                            );
                          })
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}

Future<void> _getRestaurants(RestaurantsProvider restaurantsProvider) async {
  await restaurantsProvider.getRestaurants();
}

void _searchRestaurants(RestaurantsProvider restaurantsProvider, String keyword,
    List<Restaurant> restaurants) {
  restaurantsProvider.updateFilteredRestaurants(restaurants);
  final filteredRestaurants = restaurants.where((restaurant) {
    final restaurantName = restaurant.name.toLowerCase();
    final input = keyword.toLowerCase();
    return restaurantName.contains(input);
  }).toList();
  restaurantsProvider.updateFilteredRestaurants(filteredRestaurants);
}
