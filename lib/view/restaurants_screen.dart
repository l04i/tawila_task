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
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Taste the World,",
                style: AppTextStyles.heading,
              ),
              Text(
                "Right Here at Homes",
                style: AppTextStyles.heading,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                        hintText: 'Search Your Restaurans',
                        hintStyle: AppTextStyles.body,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r)))),
              ),
            ],
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
        color: AppColors.lightBackground,
      ),
    );
  }
}
