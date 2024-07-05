import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tawila_task/constants.dart';
import 'package:tawila_task/providers/restaurants_provider.dart';
import 'package:tawila_task/view/reusable_widgets.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _getRestaurants(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<RestaurantsProvider>(
            builder: (context, restaurantsProvider, child) {
          if (restaurantsProvider.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            ));
          } else if (restaurantsProvider.errorMessage != null) {
            return ErrorMessageView(
              errorMessage: restaurantsProvider.errorMessage!,
              refresh: () => _getRestaurants(context),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(10.h),
              child: RefreshIndicator(
                backgroundColor: AppColors.secondary,
                color: AppColors.primary,
                onRefresh: () => _getRestaurants(context),
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
                      const AppSearchBar(),
                      Text(
                        'Our Restaurants',
                        style: AppTextStyles.heading,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: restaurantsProvider.restaurants.length,
                          itemBuilder: (context, index) {
                            return RestaurantCard(
                              restuarant:
                                  restaurantsProvider.restaurants[index],
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconContainer(icon: Icons.menu),
        Image.asset(
          "assets/images/tawila_logo.png",
          height: 75.h,
          width: 75.w,
        ),
        const IconContainer(icon: Icons.notifications),
      ],
    );
  }
}

Future<void> _getRestaurants(BuildContext context) async {
  await Provider.of<RestaurantsProvider>(context, listen: false)
      .getRestaurants();
}
