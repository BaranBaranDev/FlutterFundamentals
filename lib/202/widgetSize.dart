import 'package:flutter/material.dart';

class WidgetSizeEnumLaernView extends StatefulWidget {
  const WidgetSizeEnumLaernView({Key? key}) : super(key: key);

  @override
  State<WidgetSizeEnumLaernView> createState() => _WidgetSizeEnumLaernViewState();
}

class _WidgetSizeEnumLaernViewState extends State<WidgetSizeEnumLaernView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card( // card 
        child: Container(
          height: WidgetSizes.normalCardHeight.value(),
          color: Colors.green,
        ),
      ),
    );
  }
}
// enum oluşturduk 
enum WidgetSizes { normalCardHeight, circleProfileWidth }
// extension ile de enum sınıfımıza güç vereceğimizi haberdar ettik 
extension WidgetSizeExtension on WidgetSizes {

  // double fonks 
  double value() {
    switch (this) { // switch yapısıyla koşllar  kurduk this ile enumu belirttik 
      case WidgetSizes.normalCardHeight: // bu seçilirse 
        return 30; // döndür 
      case WidgetSizes.circleProfileWidth:
        return 25;
    }
  }
}