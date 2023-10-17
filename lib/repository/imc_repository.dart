import 'package:imc_calc_flutter/models/imc.dart';

class IMCRepository {
  final List<IMC> _imcs = [];

  Future<void> addIMC(IMC imc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _imcs.add(imc);
  }

  Future<List<IMC>> readAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _imcs;
  }

}
