import 'package:imc_calc_flutter/core/database/sqlite_database.dart';
import 'package:imc_calc_flutter/models/imc.dart';

class IMCRepository {

  Future<void> addIMC(IMC imc) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'INSERT INTO dados (altura, peso) values(?,?)', [imc.altura, imc.peso]);
    db.close();
  }

  Future<List<IMC>> readAll() async {
    List<IMC> dados = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery('SELECT altura, peso FROM dados');
    for (var element in result) {
      dados.add(IMC(
        altura: double.parse(element["altura"].toString()),
        peso: double.parse(element["peso"].toString()),
      ));
    }
    db.close();
    return dados;
  }

}
