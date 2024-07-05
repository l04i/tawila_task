import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawila_task/constants.dart';
import 'package:tawila_task/models/restaurant.dart';

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

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  const AppSearchBar(
      {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: TextFormField(
          onChanged: (keyword) => onChanged(keyword),
          controller: controller,
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
  final Restaurant restuarant;
  const RestaurantCard({
    super.key,
    required this.restuarant,
  });

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
                  restuarant.photoUrl!,
                  height: 150.h,
                  width: 150.w,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restuarant.name!,
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
                        restuarant.rating!,
                        style: AppTextStyles.subHeading,
                      )
                    ],
                  )
                ],
              ),
              Text(
                restuarant.description!,
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

class ErrorMessageView extends StatelessWidget {
  final String errorMessage;
  final Function refresh;
  const ErrorMessageView(
      {super.key, required this.errorMessage, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              refresh;
            },
            child: Icon(
              Icons.refresh,
              color: AppColors.primary,
              size: 150.w,
            ),
          ),
          Text(
            errorMessage,
            style: AppTextStyles.heading,
          ),
        ],
      ),
    );
  }
}
