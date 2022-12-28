//flutter pub add flutter_spinkit

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key, this.size}) : super(key: key);
  final double? size; // null gelebilir 
  final _deafultSize = 40.0; // null ise default değer atanır 

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: Colors.red,
      size: size ?? _deafultSize,
    );
  }
}