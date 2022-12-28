import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemosView extends StatelessWidget {
  NoteDemosView({super.key});

  final ColorItemsClass _colorItemsClass =
      ColorItemsClass(); // class özelliği nesneye aktarıldı onunla renkleri kullanacağız
  @override
  Widget build(BuildContext context) {
    //? BURALARA KOD YAZMAA
    //projeye başlarken nereye ne konacağını düşün başla temiz kodla
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorItemsClass.greyColor, // temiz oldu
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark, // önemli gözden kaçırma
      ),
      backgroundColor: _colorItemsClass.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingClass.paddingNotes,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Image.asset("images/apple.png"),
              SizedBox(height: PaddingClass.sizeboxSmall),
              TextNotesClass(
                title: _naber,
              ),
              SizedBox(height: PaddingClass.sizeboxSmall),
              ElevatedButton(onPressed: () {}, child: Text(_buton)),
              SizedBox(height: PaddingClass.sizeboxSmall),
            ],
          ),
        ),
      ),
    );
  }
}

class TextNotesClass extends StatelessWidget {
  const TextNotesClass({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

//Renkler için
class ColorItemsClass {
  final Color _greyColor =
      const Color.fromARGB(255, 244, 239, 239); // tanımlandı
  final Color _whiteColor = const Color(0xFFEFEAEF);

  Color get greyColor =>
      _greyColor; // get ile değişken tanımlandı return yukarıda ki özellikler
  Color get whiteColor => _whiteColor;
}

//Aralık vermek için
class PaddingClass {
  static const paddingNotes =
      EdgeInsets.only(left: 25, right: 30, bottom: 20, top: 40);

  static double get sizeboxSmall => 30;
}

//textimiz
String get _naber => "Elmayla kal";
String get _buton => "Tıklayıp Geçelim";
