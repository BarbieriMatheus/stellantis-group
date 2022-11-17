import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:global_solution_2/models/Vehicle_model.dart';

class ListVehicleProvider extends ChangeNotifier {
  List<Vehicle> _vehicles = [];

  UnmodifiableListView<Vehicle> get getVehicles =>
      UnmodifiableListView(_vehicles);

  void setVehicles(List<Vehicle> vehicles) {
    _vehicles = vehicles;
    notifyListeners();
  }
}
