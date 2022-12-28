import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder( // builder belli adet çizer kaydırdıkça o kadar daha çizer
      // seperated de ise separet builder araya gelecek widget yazılır tercihen divider ve item bellidir 
        itemBuilder: (context, index) {
          return Text("$index");
// SEPERATEDİ DEMO UYG İLE 101 DE YAPACAĞIM BEN ORADAN İNCELEYEBİLİRSİN
        },
      ),
    );
  }
}
