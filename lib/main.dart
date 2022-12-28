import 'package:flutter/material.dart';
import '303/provider/themaNotf_learn/themaProvider.dart';
import 'product/Navigate/navigator_route.dart';
import 'package:provider/provider.dart';

import '303/lottie/lottie_view.dart';
import '303/provider/change.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemaNotifier>(create: (context) => ThemaNotifier()),
    ChangeNotifierProvider<ChangeLoad>(create: (context) => ChangeLoad()) // burada haber vereceğini belli ettin ki diğer classlarda uğraşma diye 
  ],
  builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light, // açık tema
        debugShowCheckedModeBanner: false, // banner kaldırıldı
        title: "Flutteri Hatim Ediyorum", // arka planda gözüken isim
        theme: context
            .watch<ThemaNotifier>()
            .currentThema, // mevcut temamız ,watch ile sürekli akışı kontrol edeceğiz
        // LighTheme().theme,
        //
        //
        // ThemeData(
        //   primarySwatch: Colors.blue,
        // ).copyWith(
        //     tabBarTheme: const TabBarTheme(
        //         labelColor: Colors.white), // tabbar temayı ayarlarsın
        //     // copyWith ile özellikleri değiştirip her tarafa uyguluyoruz
        //     // appbar temasını değiştirdik
        //     appBarTheme: const AppBarTheme(
        //         //burada ki kodlar her sayfaya uygulanır ondan dolayı tekrar yazmak gibi bir çılgınlık yapma
        //         centerTitle: true, // textler merkeze hizalanacak
        //         backgroundColor: Colors.transparent // renk naynn :)
        //         )),g
        // routes: {
        //   "/home":(context) => const LottieView()
        // },
       //? routes: NavigatorRoures().items, // geçiş için 
        home: const LottieView());
  }
}
// basit widgetları method yap çıkar ama komplex bir şey varsa widget olarak çıkart
//!Maine kod yazılmaz kodlar alt klasörlere yazılır
