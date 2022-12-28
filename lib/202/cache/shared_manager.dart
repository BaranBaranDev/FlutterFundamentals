// anaclassımız

import 'package:flutterogreniyorum/202/cache/shared_not_initalze.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*
class SharedManager {
  //? adım1 yazma,okuma ve kaldırma için fonk kur
  // void saveString(String key,String value){} // kayıt
  // void getString(String key){}  // almak
  // void remove(String key){} // silme
  // --
  // final prefs = await SharedPreferences.getInstance(); statictir hep var 
  // ------------------------------------------------------------------------//


  //! YAZMA 
  Future<void> saveString(String key, String value) async {
    //? bekleme olacağından future yapısında kurduk
    final prefs =
        await SharedPreferences.getInstance(); // yetki ve özellikler  verildi
    // Save an integer value to 'counter' key.
    await prefs.setString(
        'counter', value); // keylerle okunur value ise kayıt edilecek
  } //bekleme olacağından future yapısında kurduk




  //!OKUMA
  Future<String?> getString(String key) async {
    //?geriye string döndüreceğiz
    final prefs = await SharedPreferences.getInstance(); // prefs gerekliydi
  
    return prefs.getString('counter'); // okuma işlemi
  } //geriye string döndüreceğiz




  //!SİLME
  Future<bool> removeItems(String key) async {
    //? işlem başarılı mı diye geriye bool döndürür
     final prefs = await SharedPreferences
            .getInstance(); // yetki ve özellikler  verildi
        // Save an integer value to 'counter' key.
      return  await prefs.remove(
            'counter'); // keylerle silinir
  } // işlem başarılı mı diye geriye bool döndürür

}

*/

import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys {
  counter,
  users
} // keyler için enum kullandık karışıklığı önleme amaçlı

class SharedManager {
  SharedPreferences?
      preferences; // prefrerences her methotta vardı construck halinnde burada da oluşturabilirsin aşağıda ki şekilde yada burada kullandığımız gibi view kodların olduğu yerde initState de çağır
  /*
  SharedManager(){
    init();
  } 
   */

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPrefences() { // null olursa exception fırlatır 
    if (preferences == null) throw SharedNotInitiazleException();
  }


  Future<void> saveString(SharedKeys key, String value) async { // kayıt 
    _checkPrefences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async { // liste kayıt
    _checkPrefences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) { // liste okuma
    _checkPrefences();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) { // okuma 
    _checkPrefences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async { // silme 
    _checkPrefences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
