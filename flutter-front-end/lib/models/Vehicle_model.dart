import 'package:global_solution_2/models/Environment_model.dart';

class Vehicle {
  int? id;
  String brand;
  String model;
  String vehiclePlate;
  double mileage;
  Environment environment;

  Vehicle({
    this.id,
    required this.brand,
    required this.model,
    required this.vehiclePlate,
    required this.mileage,
    required this.environment,
  });

  Map toJson() => {
        "brand": brand,
        "model": model,
        "vehiclePlate": vehiclePlate,
        "mileage": mileage,
        "environment": {
          "city": environment.city,
          "airQuality": environment.airQuality,
          "state": environment.state,
          "district": environment.district
        }
      };

  Vehicle.fromJson(Map json)
      : id = json["id"],
        brand = json["brand"],
        model = json["model"],
        vehiclePlate = json["vehiclePlate"],
        mileage = json["mileage"],
        environment = Environment.fromJson(json["environment"]);
}
