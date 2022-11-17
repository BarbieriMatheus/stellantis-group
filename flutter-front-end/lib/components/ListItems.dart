import 'package:flutter/material.dart';
import 'package:global_solution_2/api/vehicle_api.dart';
import 'package:global_solution_2/components/ItemVehicle.dart';
import 'package:global_solution_2/components/Modal.dart';
import 'package:global_solution_2/models/Vehicle_model.dart';
import 'package:global_solution_2/providers/ListVehicle_provider.dart';
import 'package:provider/provider.dart';

class ListItems extends StatelessWidget {
  ListItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = VehicleApi();

    final provider = Provider.of<ListVehicleProvider>(context);

    // void removeMaintenance(int id) async {
    //   await api.deleteVehicle(id);
    //   final vehicles = await api.getVehicles();
    //   provider.setVehicles(vehicles);
    // }

    // void editCheckMaintenance(Vehicle vehicle) async {
    //   await api.updateVehicle(vehicle);
    //   final vehicles = await api.getVehicles();
    //   provider.setVehicles(vehicles);
    // }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.getVehicles.length,
      itemBuilder: (context, index) {
        var listItem = provider.getVehicles[index];
        return InkWell(
            onTap: () {
              Modal(context: context, vehicle: listItem).showBottomModal();
            },
            child: ItemVehicle(
              vehicle: listItem,
            ));
      },
    );
  }
}
