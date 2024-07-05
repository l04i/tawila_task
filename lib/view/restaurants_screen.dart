import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawila_task/constants.dart';

// color issue (icons , container , fouced border)
// font bold issue

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
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
                const SearchBar(),
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
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return RestaurantCard();
                    })
              ],
            ),
          ),
        ),
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

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(15.r)),
      child: Icon(
        icon,
        color: AppColors.icons,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: TextFormField(
          decoration: InputDecoration(
              prefixIconColor: AppColors.icons,
              prefixIcon: const Icon(
                Icons.search,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.secondary),
                  borderRadius: BorderRadius.circular(30.r)),
              suffixIconColor: AppColors.primary,
              suffixIcon: const Icon(
                Icons.filter_list,
              ),
              hintText: 'Search Your Restaurants',
              hintStyle: AppTextStyles.body.copyWith(color: AppColors.text),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r)))),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  "https://ucarecdn.com/d61da33b-8770-4a3c-ad9f-bc8046bcc4f7/-/preview/500x500/",
                  height: 150.h,
                  width: 150.w,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Julia",
                    style: AppTextStyles.heading,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "5.00",
                        style: AppTextStyles.subHeading,
                      )
                    ],
                  )
                ],
              ),
              Text(
                "Never had Lebanese food?",
                style: AppTextStyles.body.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
