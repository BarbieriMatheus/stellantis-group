import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:global_solution_2/components/FloatingButton.dart';
import 'package:global_solution_2/components/Modal.dart';
import 'package:global_solution_2/pages/ListVehicle_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  late PageController pageController;

  TextEditingController inputTitleController = TextEditingController();
  TextEditingController inputDescriptionController = TextEditingController();
  TextEditingController inputDataController = TextEditingController();
  TextEditingController inputValorController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');
  FocusNode inputTitleFocus = FocusNode();
  FocusNode inputDescriptionFocus = FocusNode();
  FocusNode inputValorFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stellantis"),
      ),
      body: ListVehicle(),
      floatingActionButton: FloatingButton(
        onPressed: () => {Modal(context: context).showBottomModal()},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
