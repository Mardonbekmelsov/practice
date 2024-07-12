import 'package:flutter/material.dart';
import 'package:practice/controllers/restaurants_cubit.dart';
import 'package:practice/services/location_services.dart';
import 'package:practice/views/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationServices.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RestaurantsCubit();
      },
      child: MaterialApp(
          home: MainScreen(),
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}
