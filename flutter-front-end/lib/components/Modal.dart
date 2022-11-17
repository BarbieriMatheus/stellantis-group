import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:global_solution_2/api/vehicle_api.dart';
import 'package:global_solution_2/components/Button.dart';
import 'package:global_solution_2/components/Input.dart';
import 'package:global_solution_2/models/Environment_model.dart';
import 'package:global_solution_2/models/Vehicle_model.dart';
import 'package:global_solution_2/providers/ListVehicle_provider.dart';
import 'package:provider/provider.dart';

class Modal {
  dynamic context;
  Vehicle? vehicle;

  Modal({required this.context, this.vehicle});

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          "Adicionar manutenção",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.cyan),
        ),
        GestureDetector(
          child: const Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  final BoxDecoration _modalBoxDecoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0, // has the effect of softening the shadow
        spreadRadius: 0.0, // has the effect of extending the shadow
      )
    ],
  );

  showBottomModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // constraints: const BoxConstraints(maxHeight: 2000),
      isScrollControlled: true,
      builder: (builder) {
        return Wrap(
          children: [
            Container(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                decoration: _modalBoxDecoration,
                child: Column(
                  children: <Widget>[
                    _header(),
                    const SizedBox(height: 5),
                    ModalContent(vehicle: vehicle),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ModalContent extends StatefulWidget {
  Vehicle? vehicle;
  ModalContent({Key? key, this.vehicle}) : super(key: key);

  @override
  State<ModalContent> createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  final api = VehicleApi();

  TextEditingController inputBrandController = TextEditingController();
  TextEditingController inputModelController = TextEditingController();
  TextEditingController inputVehiclePlateController = TextEditingController();
  TextEditingController inputMileageController = TextEditingController();

  TextEditingController inputAirQualityController = TextEditingController();
  TextEditingController inputCityController = TextEditingController();
  TextEditingController inputStateController = TextEditingController();
  TextEditingController inputDistrictController = TextEditingController();
  TextEditingController inputTempEnvironmentController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void addVehicle() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final brand = inputBrandController.text;
      final model = inputModelController.text;
      final vehiclePlate = inputVehiclePlateController.text;
      final mileage = inputMileageController.text;

      final airQuality = inputAirQualityController.text;
      final city = inputCityController.text;
      final state = inputStateController.text;
      final tempEnvironment = inputTempEnvironmentController.text;
      final district = inputDistrictController.text;

      final vehicle = Vehicle(
          brand: brand,
          model: model,
          vehiclePlate: vehiclePlate,
          mileage: double.parse(mileage),
          environment: Environment(
            airQuality: airQuality,
            city: city,
            district: district,
            state: state,
            tempEnvironment: double.parse(tempEnvironment),
          ));

      if (widget.vehicle != null) {
        vehicle.id = widget.vehicle!.id;
        await api.updateVehicle(vehicle);
      } else {
        await api.saveVehicle(vehicle);
      }
      fetchVehicles();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Cadastro realizado!'),
      ));

      inputBrandController.text = "";
      inputModelController.text = "";
      inputVehiclePlateController.text = "";
      inputMileageController.text = "";

      inputAirQualityController.text = "";
      inputCityController.text = "";
      inputStateController.text = "";
      inputTempEnvironmentController.text = "";
      inputDistrictController.text = "";

      Navigator.pop(context);
    }
  }

  void fetchVehicles() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = Provider.of<ListVehicleProvider>(context, listen: false);
      final vehicles = await api.getVehicles();
      provider.setVehicles(vehicles);
    });
  }

  @override
  void initState() {
    super.initState();
    final vehicle = widget.vehicle;
    if (vehicle != null) {
      inputBrandController.text = vehicle.brand;
      inputModelController.text = vehicle.model;
      inputVehiclePlateController.text = vehicle.vehiclePlate;
      inputMileageController.text = vehicle.mileage.toString();

      inputAirQualityController.text = vehicle.environment.airQuality;
      inputCityController.text = vehicle.environment.city;
      inputStateController.text = vehicle.environment.state;
      inputTempEnvironmentController.text =
          vehicle.environment.tempEnvironment.toString();
      inputDistrictController.text = vehicle.environment.district;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Input(
            label: "Marca",
            hint: "Digite a marca",
            userInputController: inputBrandController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a marca';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Modelo",
            hint: "Digite o model",
            userInputController: inputModelController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o modelo';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Placa do veículo",
            hint: "Digite a placa do veículo",
            userInputController: inputVehiclePlateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a placa do veículo';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Quilometragem",
            hint: "Digite a quilometragem",
            userInputController: inputMileageController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a quilometragem';
              }

              if (double.parse(value) <= 0) {
                return 'Informe um valor maior que zero';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Qualidade do ar",
            hint: "Digite a qualidade do ar",
            userInputController: inputAirQualityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a qualidade do ar';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Cidade",
            hint: "Digite a cidade",
            userInputController: inputCityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a cidade';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Bairro",
            hint: "Digite o bairro",
            userInputController: inputDistrictController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o bairro';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Estado",
            hint: "Digite o estado",
            userInputController: inputStateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o estado';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          Input(
            label: "Temperatura ambiente",
            hint: "Digite a temperatura ambiente",
            userInputController: inputTempEnvironmentController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a temperatura ambiente';
              }

              if (double.parse(value) <= 0) {
                return 'Informe um valor maior que zero';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Button(
              onPressed: () => {addVehicle()},
              label: "Salvar",
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
