import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/controllers/restaurants_cubit.dart';

class AddRestaurantDialog extends StatelessWidget{

  final String locationName;
  AddRestaurantDialog({required this.locationName});

  
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return AlertDialog(
                        title: const Text("Add restaurant"),
                        content: Column(
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Restaurant name"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: phoneNumberController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Restaurant phone number"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.read<RestaurantsCubit>().addRestaurant(
                                  nameController.text,
                                  phoneNumberController.text,
                                  locationName);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("Add Restaurant"),
                          ),
                        ],
                      );
  }
}