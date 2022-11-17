import 'dart:convert';

import 'package:global_solution_2/models/Vehicle_model.dart';
import 'package:http/http.dart' as http;

class VehicleApi {
  final String uri = "http://localhost:8080";

  Future<bool?> saveVehicle(Vehicle vehicle) async {
    print(vehicle.toString());
    final url = "$uri/vehicles";
    var response = await http.post(
      body: jsonEncode(vehicle),
      Uri.parse(url),
      headers: {
        "Authorization": "Basic ZmlhcDpWYWxpZG9AMQ==",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }

  Future<List<Vehicle>> getVehicles() async {
    var response = await http.get(
      Uri.parse("$uri/vehicles"),
      headers: {
        "Authorization": "Basic ZmlhcDpWYWxpZG9AMQ==",
      },
    );

    print(response.statusCode);

    if (response.statusCode != 200) return [];

    var jsonList = jsonDecode(response.body);

    var vehicles =
        jsonList.map<Vehicle>((json) => Vehicle.fromJson(json)).toList();

    return vehicles ?? [];
  }

  Future<bool?> updateVehicle(Vehicle vehicle) async {
    final url = "$uri/vehicles";
    var response = await http.put(
      Uri.parse(url),
      headers: {
        "Authorization": "Basic ZmlhcDpWYWxpZG9AMQ==",
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }

  Future<bool?> deleteVehicle(int id) async {
    final url = "$uri/vehicles/$id";
    var response = await http.delete(
      Uri.parse(url),
      headers: {
        "Authorization": "Basic ZmlhcDpWYWxpZG9AMQ==",
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return null;
  }
}
