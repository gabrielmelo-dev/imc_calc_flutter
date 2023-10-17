import 'package:flutter/material.dart';
import 'package:imc_calc_flutter/models/imc.dart';
import 'package:imc_calc_flutter/repository/imc_repository.dart';
import 'package:imc_calc_flutter/services/imc_calc_service.dart';
import 'package:imc_calc_flutter/widgets/app_bar.dart';

class IMCCalc extends StatefulWidget {
  const IMCCalc({super.key});

  @override
  State<IMCCalc> createState() => _IMCCalcState();
}

class _IMCCalcState extends State<IMCCalc> {
  var imcRepository = IMCRepository();
  var imcService = IMCCalcService();
  var _imcs = const <IMC>[];
  var alturaController = TextEditingController(text: "");
  var pesoController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    readIMCs();
  }

  void readIMCs() async {
    _imcs = await imcRepository.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(
          'Calculadora IMC',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        appBar: AppBar(),
        widgets: const [],
        leading: null,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 30,
            alignment: Alignment.center,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: alturaController,
              textAlign: TextAlign.center,
              style: const TextStyle(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(120),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 141, 79, 151))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(120),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 141, 79, 151))),
                hintText: "Altura",
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 30,
            alignment: Alignment.center,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: pesoController,
              textAlign: TextAlign.center,
              style: const TextStyle(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(120),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 141, 79, 151))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(120),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 141, 79, 151))),
                hintText: "Peso",
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  var altura = double.parse(alturaController.text);
                  var peso = double.parse(pesoController.text);
                  await imcRepository.addIMC(IMC(altura: altura, peso: peso));
                  setState(() {});
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120))),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 141, 79, 151))),
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _imcs.length,
              itemBuilder: (BuildContext ctx, int i) {
                IMC imc = _imcs[i];
                return ListTile(
                    leading: Text("IMC ${imcService.calculateIMC(imc.peso, imc.altura).toStringAsFixed(2)}"),
                    title: Text("Altura ${imc.altura.toStringAsFixed(2)} e Peso ${imc.peso.toStringAsFixed(2)}"),
                  subtitle:  Text("Situação: ${imcService.imcResult(imc)}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
