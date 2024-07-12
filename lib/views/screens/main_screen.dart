import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/controllers/restaurants_cubit.dart';
import 'package:practice/models/restaurant.dart';
import 'package:practice/states/cubit_states.dart';
import 'package:practice/views/screens/map_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<RestaurantsCubit>().restaurants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Restaurants"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreen()));
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: BlocBuilder<RestaurantsCubit, RestaurantState>(
          builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: Text("Ma'lumot hali yuklanmadi"),
          );
        }

        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        List<Restaurant> restaurants = (state as LoadedState).restaurants;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "restaurant: ${restaurant.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "phone number: ${restaurant.phoneNumber}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "location: ${restaurant.location}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }
}
