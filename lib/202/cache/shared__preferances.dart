//flutter pub add shared_preferences
//cache yani local depolama

import 'package:flutter/material.dart';
import 'package:flutterogreniyorum/101/ozelWidgetGelistirme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceLearn extends StatefulWidget {
  const SharedPreferanceLearn({super.key});

  @override
  State<SharedPreferanceLearn> createState() => _SharedPreferanceLearnState();
}

class _SharedPreferanceLearnState
    extends LoadingStatefull<SharedPreferanceLearn> {
  int _currentInt = 0; // atamanın yapılacağı ve mevcut değer
  void _onChangedValue(String value) {
    // gelen string data parse edilip ekranda güncellenecek
    final _value =
        int.tryParse(value); // string datayı bu şekilde parse edebilirsin

    if (_value != null) {
      // daha sağlam olması için iflerle null değilse koşulu kurduk
      setState(() {
        _currentInt =
            _value; // atama işlemi ekranda görmek istediğimizden dolayı da setState içinde oldu
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _readCounterData(); // read işlemi methodu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min, // bu sayede yanyana duracaklar
        children: [
          _saveButton(), // kayıt için
          _removeButton() // silmek için
        ],
      ),
      appBar: AppBar(
        title: Center(child: Text(_currentInt.toString())),
      ),
      body: Center(
        child: TextField(
          onChanged: (value) => _onChangedValue(
              value), // anlık okuma için onChanged , okunacak veri valuye ve string gelir
        ),
      ),
    );
  }

  FloatingActionButton _saveButton() {
    return FloatingActionButton(
      child: isLoading
          ? const CircleProgressRedIndikator()
          : const Icon(Icons.save),
      onPressed: () async {
        changeLoading(); // işlem başlayınca loading dönmesi için
        final prefs = await SharedPreferences
            .getInstance(); // yetki ve özellikler  verildi
        // Save an integer value to 'counter' key.
        await prefs.setInt(
            'counter', _currentInt); // keylerle okunur value ise kayıt edilecek

        changeLoading(); // işlem bitince loading durması  için
      },
    );
  }

  FloatingActionButton _removeButton() {
    return FloatingActionButton(
      child: isLoading
          ? const CircleProgressRedIndikator()
          : const Icon(Icons.delete),
      onPressed: () async {
        changeLoading(); // işlem başlayınca loading dönmesi için
        final prefs = await SharedPreferences
            .getInstance(); // yetki ve özellikler  verildi
        // Save an integer value to 'counter' key.
        await prefs.remove(
            'counter'); // keylerle okunur value ise kayıt edilecek

        changeLoading(); // işlem bitince loading durması  için
      },
    );
  }

  Future<void> _readCounterData() async {
    final prefs = await SharedPreferences.getInstance(); // prefs gerekliydi
    final int? counter = prefs.getInt('counter'); // okuma işlemi
    _onChangedValue(counter
        .toString()); // methodumuza datayı yolladık init kısmına da okuma fonks verince build öncesi kontrol edecektir
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
