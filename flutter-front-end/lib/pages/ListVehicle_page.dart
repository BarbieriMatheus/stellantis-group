import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:global_solution_2/api/vehicle_api.dart';
import 'package:global_solution_2/components/ListItems.dart';
import 'package:global_solution_2/providers/ListVehicle_provider.dart';
import 'package:provider/provider.dart';

class ListVehicle extends StatefulWidget {
  const ListVehicle({Key? key}) : super(key: key);

  @override
  State<ListVehicle> createState() => _ListVehicleState();
}

class _ListVehicleState extends State<ListVehicle> {
  final api = VehicleApi();

  @override
  void initState() {
    carregarTransacoes();

    super.initState();
  }

  void carregarTransacoes() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = Provider.of<ListVehicleProvider>(context, listen: false);
      final vehicles = await api.getVehicles();
      provider.setVehicles(vehicles);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListVehicleProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 4,
                color: Colors.blue,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Lista de carros",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Adicione um carro da Stellatins",
                    style: TextStyle(
                        fontSize: 16,
                        wordSpacing: 4,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ),
        ListItems(),
      ],
    );
  }
}
