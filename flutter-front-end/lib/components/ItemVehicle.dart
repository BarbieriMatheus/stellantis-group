import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:global_solution_2/api/vehicle_api.dart';
import 'package:global_solution_2/models/Vehicle_model.dart';
import 'package:global_solution_2/providers/ListVehicle_provider.dart';
import 'package:provider/provider.dart';

class ItemVehicle extends StatefulWidget {
  final Vehicle vehicle;
  ItemVehicle({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<ItemVehicle> createState() => _ItemVehicleState();
}

class _ItemVehicleState extends State<ItemVehicle> {
  final api = VehicleApi();
  final GlobalKey<ExpansionTileCardState> key = GlobalKey();

  void fetchVehicles() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = Provider.of<ListVehicleProvider>(context, listen: false);
      final vehicles = await api.getVehicles();
      provider.setVehicles(vehicles);
    });
  }

  @override
  Widget build(BuildContext context) {
    var details = <Widget>[
      const Divider(
        thickness: 1.0,
        height: 1.0,
      ),
      const SizedBox(height: 16),
      LineItem(
        label: "Placa do veiculo",
        value: widget.vehicle.vehiclePlate,
      ),
      LineItem(
        label: "Quilometragem",
        value: widget.vehicle.mileage.toString(),
      ),
      LineItem(
        label: "Qualidade do Ar",
        value: widget.vehicle.environment.airQuality,
      ),
      LineItem(
        label: "Cidade",
        value: widget.vehicle.environment.city,
      ),
      LineItem(
        label: "Bairro",
        value: widget.vehicle.environment.district,
      ),
      LineItem(
        label: "Estado",
        value: widget.vehicle.environment.state,
      ),
      LineItem(
          label: "Temperatura do ambiente",
          value: widget.vehicle.environment.tempEnvironment.toString()),
      RowIconButton(
        iconsButtons: [
          IconButton(
            label: "Deletar",
            icon: Icons.copy_outlined,
            onTap: () async {
              if (widget.vehicle.id != null) {
                await api.deleteVehicle(widget.vehicle.id!);
                fetchVehicles();
              }
            },
          ),
        ],
      ),
      const SizedBox(height: 16)
    ];

    return ExpansionTileCard(
      baseColor: Colors.grey[200],
      expandedColor: Colors.lightBlue[100],
      expandedTextColor: Colors.black,
      key: key,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(4, 16, 4, 6),
        child: Text(
          widget.vehicle.brand,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
        child: Text(widget.vehicle.model),
      ),
      children: details,
    );
  }
}

class LineItem extends StatelessWidget {
  final String label;
  final String value;

  const LineItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) {
      return Container();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$label: ",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class RowIconButton extends StatelessWidget {
  final List<IconButton> iconsButtons;

  RowIconButton({
    required this.iconsButtons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: iconsButtons,
        ),
      ],
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;

  IconButton({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [Icon(icon), const SizedBox(width: 16), Text(label)],
      ),
    );
  }
}
