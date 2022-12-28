// Bir ekran olacak
// Bu ekranda 3 button ve bunlara basinca renk degisimi olacak
// Secili olan button selected icon olsun

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor; //? bu kod satırı ile varsayılan bir arka plan belirledik
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;  //? daha önce yaptımız gibi bu classa eşitlenecek bir değişken 

  @override
  void initState() { // build tetiklenmeden gözükmesi için 
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) { // dışarıdan color gelecek 
    setState(() {
      _backgroundColor = color; // eşitleme yapıldı 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor, // eşitlenen değer aktarıldı 
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: 'Red'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: 'Yellow'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'Blue'),
      ]),
    );
  }

// fonks türünü mutlaka belirt 
  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) { // okunaklı ve sağlıklı olması için emun kullandık 
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue } // index yerine enum ile daha okunaklı kullandık
// enum isim ve süslü parantez içine değerler yazılarak kullanılır 

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}