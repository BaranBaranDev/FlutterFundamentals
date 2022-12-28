import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemaNotifier extends ChangeNotifier {
  // NEREDE HABER ORADA ChangeNotifier
  // ChangeNotifier entegre ettiğim bir class burada temayı değiştireceğiz

  bool isLightThema = true;
  void changeThema() {
    isLightThema = !isLightThema;
    notifyListeners(); // bütün ekrana haber verir
  }

  ThemeData
      get currentThema => // get ile çağrılır çağrılmaz oluşturacağız ,mevcut tema
          isLightThema
              ? ThemeData.light() // true
              : ThemeData.dark(); // false
}

//!Not: PROVİDERİ BELLİ YERLERDE KULLANACAKSAN SCAFFOLD MESELA STATELES WİDGETTA SAR CREATE DE ALTINA DA RETURNLET SAYFAYI
/* KULLANABİLMEK İÇİN Multi de array alsın sonrada ChangeNotifierProvider dan türet 
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemaNotifier>(create: (context) => ThemaNotifier())
  ]));
}
*/
