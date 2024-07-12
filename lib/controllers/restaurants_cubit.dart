import 'package:bloc/bloc.dart';
import 'package:practice/models/restaurant.dart';
import 'package:practice/states/cubit_states.dart';

class RestaurantsCubit extends Cubit<RestaurantState> {
  RestaurantsCubit() : super(InitialState());
  List<Restaurant> restaurants = [];

  Future<void> addRestaurant(
      String name, String phoneNumber, String locationName) async {
    try {
      if (state is LoadedState) {
        restaurants = (state as LoadedState).restaurants;
      }

      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 1));

      restaurants.add(Restaurant(
          name: name, phoneNumber: phoneNumber, location: locationName));
      emit(LoadedState(restaurants));
    } catch (e) {
      emit(ErrorState("Qo'shishda xatolik"));
    }
  }
}
