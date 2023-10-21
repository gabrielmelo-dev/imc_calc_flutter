import 'package:imc_calc_flutter/models/imc.dart';

class IMCCalcService {
  double calculateIMC(double peso, double altura) {
    return double.parse((peso / (altura * altura)).toStringAsFixed(2));
  }

  String imcResult(IMC imc) {
    final imcRes = calculateIMC(imc.peso, imc.altura);

    if (imcRes < 16) {
      return "Magreza grave";
    } else if (imcRes >= 16 && imcRes < 17) {
      return "Magreza moderada";
    } else if (imcRes >= 17 && imcRes < 18.5) {
      return "Magreza leve";
    } else if (imcRes >= 18.5 && imcRes < 25) {
      return "Saudavel";
    } else if (imcRes >= 25 && imcRes < 30) {
      return "Sobrepeso";
    } else if (imcRes >= 30 && imcRes < 35) {
      return "Obesidade Grau I";
    } else if (imcRes >= 35 && imcRes < 40) {
      return "Obesidade Grau II";
    } else if (imcRes >= 40) {
      return "Obesidade Grau III";
    }
    return "";
  }
}
