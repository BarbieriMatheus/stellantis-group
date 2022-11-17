import 'package:global_solution_2/models/Vehicle_model.dart';

class Environment {
  int? id;
  Vehicle vehicle;
  DateTime operateDate;

  Environment({
    this.id,
    required this.vehicle,
    required this.operateDate,
  });
}
