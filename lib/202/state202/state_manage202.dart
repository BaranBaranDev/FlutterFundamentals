import 'package:flutter/material.dart';

// SET STATE KULLANMAK ŞÇŞN STATE LAZIMDI EXTEND ETTİK SOYUT SINIF KURDUK DAHA SONRA GÖRÜNTÜYÜ İÇEREN SINIFA EXTENDS ETTİK 
abstract class StateManage202  extends State {
   bool isCheck = true; // başlangıçta gözükecek
  void isVisible() {
    setState(() {
      isCheck = !isCheck; // tıkladıkça tersi alınacak
    });
  }
}