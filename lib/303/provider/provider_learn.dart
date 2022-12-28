// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//? bu haber vermeyi my app de uygula
// https://youtu.be/19gZHv9QBk4 bakabilirsin
// class ProviderView extends StatelessWidget {
//   const ProviderView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return Provider(
//       create: (_) {
//        return ProviderItems;
//        },
//       child: Scaffold(
//         body: Center(
//           child: Text(Provider.of<ProviderItems>(context).city),
//         ),
//       ),
//     );
//   }
// }

// class ProviderItems {
//   final String city = "Alaska";
// }

//!Gelelim asıl konuya

class ProviderView extends StatelessWidget {
  const ProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TextField(
            onChanged: (value) {
              Provider.of<ProviderItems>(context).changeCity(value); // gelen text provider sayesinde okunan methoda aktarılıp güncelleme işlemi sağlayacağız
            },
          ),
          Text(Provider.of<ProviderItems>(context).city)
        ],
      ),
    );
  }
}

class ProviderItems extends ChangeNotifier {
  //extends ile her şeyi entegre edersin with ile belli özelllikler ve birden fazla class entegre etmen lazımsa with kullan
  String city = "İZMİR";
  void changeCity(String data) {
    city = data; // dışarıdan geleni city'e eşitle
    notifyListeners(); // haber vereceğim kanka diyip bıraktık :)
  }
}
