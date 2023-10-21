import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  alturaKey,
}

class IMCPreferences {

  Future<void> setAltura(double altura) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(StorageKey.alturaKey.toString(), altura);
  }

  Future<double> getAltura() async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(StorageKey.alturaKey.toString()) ?? 0;

  }

}
