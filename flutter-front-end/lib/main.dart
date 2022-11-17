import 'package:flutter/material.dart';
import 'package:global_solution_2/pages/Home_page.dart';
import 'package:global_solution_2/providers/ListVehicle_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ListVehicleProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"/": (context) => const Home()},
      initialRoute: "/",
    ),
  ));
}
