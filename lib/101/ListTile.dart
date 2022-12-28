import 'package:flutter/material.dart';

//! Listtile,Expanded ve spacer

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // column dikey,row yatay , stack içiçe
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            tileColor: Colors.amber, // alan rengi
            contentPadding: const EdgeInsets.all(5), // padding verdik
            //autofocus: true ,
            onTap: () {}, // TIKLANABİLİRLİK
            title: const Text("Title"),
            subtitle: const Align(
                // align ile yerini değiştirdim görmen için yaptım
                alignment: Alignment.center,
                child: Text('Subtitle')),
            leading: const Icon(Icons.search), // SOL
            trailing: const Icon(Icons.login), // SAĞ
            dense: true, //sıkıştırır
          ),
          Row(
            //! mainAxisSize: MainAxisSize.min, önemlidir max olarak gelir min dersen diğerlerini okumaz yapışık durur
            mainAxisAlignment: MainAxisAlignment
                .spaceAround, // sarmalananın merkezinde hareket eder Cross ise tersinden
            children: const [
              Text("data"),
              Text("sgsgs"),
              Text("sdggaaapşağ"),
            ],
          ),
          //? Expanded uyumlu ekranda önemli yer kaplar
          Expanded(
            // kalan alanı uzatır alır ama flex ile oran belirtebilirsin
            flex: 7, // yüzde 70 kırmızı
            child: Container(
              color: Colors.red,
              //height: 75,
            ),
          ),
          const Spacer(
            flex: 1, // yüzde 10 boşluk
          ),
          Expanded(
            // nereyi kapsamasını istersen oran belirtebilirsin dikey yatay uyumlu olur bu sayede
            flex: 2, // yüzde 20 mavi oldu
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
