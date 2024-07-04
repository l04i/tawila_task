import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Holder"),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {},
          child: const Text("Get it"),
        ),
      ),
    );
  }
}
